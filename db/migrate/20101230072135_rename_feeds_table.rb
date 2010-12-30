class RenameFeedsTable < ActiveRecord::Migration
  def self.up
    rename_table :feeds, :subscriptions
  end

  def self.down
  end
end
