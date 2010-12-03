class User < ActiveRecord::Base
	has_many :authoriztions
	has_many :feeds
	def self.create_from_hash!(hash)
	  create(:name => hash['user_info']['name'])
	end

end
