require 'open-uri'
require 'rss'
require 'hpricot'

class FeedsController < ApplicationController
  include FeedHelper
  def index
	@feeds =current_user.feeds
	p @feeds
  end

  def new
	@feed= Feed.new()
  end
  	
  def create
    @feed = current_user.feeds.create!(params[:feed])

    begin
	link = processRssLink(@feed[:link])
	rss = parse(link)
    rescue
	flash[:error]='The url is not a valid feed link'
	redirect_to(:action=>'new')
	return
    end


    
    @feed.link = link
    @feed.title = rss.channel.title
    @feed.description = rss.channel.description
    @feed.LastUpdate = rss.items.last.date.to_s

    if @feed.save
	redirect_to(:controller=>:home, :action=>:index)
    else
	flash[:error]='Creating new feed failed.'
	redirect_to(:action=>'new')
    end
  end
  
  def show
    @feed = Feed.find(params[:id])
    @rss = parse(@feed.link)
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to(:action=>'index')
  end

  def update
    @feed = Feed.find(params[:id])
    @feed.update_attributes(params[:feed])
    redirect_to(:action=>'show') 
  end


end
