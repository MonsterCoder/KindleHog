class CreateAuthentications < ActiveRecord::Migration
  def self.up
    create_table :authentications do |t|
      t.string :uid
      t.string :provider
      t.string :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :authentications
  end
end
