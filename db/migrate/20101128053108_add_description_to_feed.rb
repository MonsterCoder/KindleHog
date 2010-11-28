class AddDescriptionToFeed < ActiveRecord::Migration
  def self.up
	add_column :feeds, :description, :string
  end

  def self.down
	remove_column :feeds, :description
  end
end
