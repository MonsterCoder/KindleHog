require 'open-uri'
require 'rss'
require 'hpricot'

class FeedsController < ApplicationController
  def index
	@feeds =Feed.find(:all)
  end

  def new
	@feed= Feed.new()
  end
	
  def create
    link = params[:feed][:link]
    link = processRssLink(link)
    
    begin
	parse(link)
    rescue
	flash[:error]='The url is not a valid feed link'
	redirect_to(:action=>'new')
	return
    end

    @feed = Feed.new(params[:feed])
    @feed.link = link
    if @feed.save
	redirect_to(:action=>'show', :id => @feed.id)
    else
	redirect_to(:action=>'new')
    end
  end
  
  def show
    @feed = Feed.find(params[:id])
    @rss = parse(@feed.link)
    
    #APPFeedMailer.email(@response, response).deliver
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

private

  def parse(link)
    content = ''
    open(link) { |f|
	content = f.read
    }

    RSS::Parser.parse(content, false)
 
  end

  def processRssLink(link)
    content = ''
    open(link) { |f|
	content = f.read
    }
    doc = Hpricot(content)
   #(doc/"head/link").each do |p|
   #	puts p.attributes['type']
   # end
    rsslink = (doc/"head/link").detect {|l| l.attributes['rel']=="alternate"}
    link = rsslink.attributes['href'] if rsslink
    link
  end

end
