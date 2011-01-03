module FeedHelper
  def parse(link)
    content = ''
    open(link) { |f|
	      content = f.read
    }

    RSS::Parser.parse(content, false)
 
  end

  def processRssLink(link)
    content = ''
    link = "http://" + link unless link.match(/^http:\/\//)
        
    open(link) { |f|
	    content = f.read
    }
    
    doc = Hpricot(content)

    rsslink = (doc/"head/link").detect {|l| l.attributes['rel']=="alternate"}
    link = rsslink.attributes['href'] if rsslink
    link
  end
end
