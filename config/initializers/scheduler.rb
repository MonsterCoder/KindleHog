require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

  scheduler.every  '60m' do
      PublishController.new.process
  end


