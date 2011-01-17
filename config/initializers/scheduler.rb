require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

  scheduler.every  '45m' do
      PublishController.new.process
  end


