class AddLastUpdateToFeed < ActiveRecord::Migration
  def self.up
	add_column :feeds, :LastUpdate, :datetime
  end

  def self.down
	add_column :feeds, :LastUpdate
  end
end
