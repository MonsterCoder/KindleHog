require 'culerity'

class Capybara::Driver::Culerity < Capybara::Driver::Celerity

  def self.server
    unless @_server
      @_server = ::Culerity::run_server
      at_exit do
        @_server.close
      end
    end
    @_server
  end

  def browser
    unless @_browser
      @_browser = ::Culerity::RemoteBrowserProxy.new self.class.server, options
      at_exit do
        @_browser.close
        @_browser.exit
      end
    end
    @_browser
  end

end
