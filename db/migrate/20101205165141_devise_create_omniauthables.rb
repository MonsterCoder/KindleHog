class DeviseCreateOmniauthables < ActiveRecord::Migration
  def self.up
    create_table(:omniauthables) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :omniauthables, :email,                :unique => true
    add_index :omniauthables, :reset_password_token, :unique => true
    # add_index :omniauthables, :confirmation_token,   :unique => true
    # add_index :omniauthables, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :omniauthables
  end
end
