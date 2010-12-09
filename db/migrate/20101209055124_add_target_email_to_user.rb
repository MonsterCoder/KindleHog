class AddTargetEmailToUser < ActiveRecord::Migration
  def self.up
	add_column :users, :targetEmail, :string
  end

  def self.down
	remove_column :users, :targetEmail
  end
end
