class AddAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :address, :string, null: false
  end
end
