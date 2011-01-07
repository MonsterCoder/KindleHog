class AddEmailandScheduledSendToSettings < ActiveRecord::Migration
  def self.up
    add_column :settings, :email, :string
    add_column :settings, :schedualed_send, :datetime
    add_column :settings, :items_after, :datetime
  end

  def self.down
    remove_column :settings, :email
    remove_column :settings, :schedualed_send
    remove_column :settings, :items_after
  end
end
