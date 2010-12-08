class ChangeFeedUseridType2 < ActiveRecord::Migration
  def self.up
	remove_column :feeds, :user_id
	add_column :feeds, :user_id, :integer
  end

  def self.down
  end
end
