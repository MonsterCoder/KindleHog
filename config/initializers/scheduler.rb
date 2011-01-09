require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

  scheduler.every  '1m' do
      PublishController.process
  end


