class AddKindleAddressToUser < ActiveRecord::Migration
  def self.up
	add_column  :users, :kindleAddress, :string
  end

  def self.down
	remove_cloumn :user, :kindleAddress
  end
end
