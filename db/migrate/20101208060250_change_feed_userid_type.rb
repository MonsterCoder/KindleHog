class ChangeFeedUseridType < ActiveRecord::Migration
  def self.up
	change_column :feeds, :user_id, :integer
  end

  def self.down
  end
end
