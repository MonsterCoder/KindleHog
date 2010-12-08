class ChangeFeedUseridType2 < ActiveRecord::Migration
  def self.up
	remove_column :feeds, :user_id
	add_column :feeds, :user_id, :integer
	Feed.reset_column_information 
  end

  def self.down
  end
end
