class ChangeSchedualedSendToInterger < ActiveRecord::Migration
  def self.up
      create_table :settings do |t|
        t.string :send_to 
        t.integer :schedualed_send 
        t.datetime :items_after
        t.references :user
      end
  end

  def self.down
  end
end
