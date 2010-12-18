require 'open-uri'
require 'rss'
require 'hpricot'

class FeedsController < ApplicationController
  include FeedHelper
  include PublishHelper

  respond_to :html, :js

  def index
	@entries = GetSubscriptions(current_user.feeds)
	render  :layout=>"reader"
  end

  def new
	@feed= current_user.feeds.build()
	respond_with(@feed)
  end
  	
  def create
    @feed = current_user.feeds.build(params[:feed])

    begin
	link = processRssLink(@feed[:link])
	rss = parse(link)
    rescue
	redirect_to(@feed, :notice=>"Not a valid feed link'")
	return
    end

    @feed.link= link
    @feed.title= rss.channel.title
    @feed.description= rss.channel.description
    @feed.LastUpdate= rss.items.last.date.to_s

    if @feed.save
	respond_to do |format| 
		format.html	{ redirect_to feeds_url	}
		format.js	{ @entries = GetSubscriptions([@feed])}		   			
	end
    else
	flash[:error]='Creating new feed failed.'
	respond_to  do |format|
		format.html	{render @feed	}		
		format.js	
	end
    end
  end
  
  def show
    feed = Feed.find(params[:id])
    rss = parse(feed.link)
    @entries =  GetSubscriptions([feed])
    render :layout=>"reader"
  end

  def edit
    @feed = Feed.find(params[:id])
    render @feed
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to :back
  end

  def update
    @feed = Feed.find(params[:id])
    @feed.update_attributes(params[:feed])
    redirect_to(:action=>'show') 
  end




end
