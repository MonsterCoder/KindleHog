class Subscription < ActiveRecord::Base
  attr_accessible :title, :link, :LastUpdate
	belongs_to :user
end
