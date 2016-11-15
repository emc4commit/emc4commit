class AddEmercoinAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :emercoin_address, :string
  end
end
