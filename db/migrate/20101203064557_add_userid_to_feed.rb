class AddUseridToFeed < ActiveRecord::Migration
  def self.up
	add_column :feeds, :user_id, :string
  end

  def self.down
	remove_column :feeds, :user_id
  end
end
