require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

  scheduler.in  '1m' do
      RAILS_DEFAULT_LOGGER.info("++++++++++++++scheduler starts++++++++++++++++++++")
      PublishController.new.process
  end


