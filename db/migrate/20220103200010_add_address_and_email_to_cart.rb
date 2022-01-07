class AddAddressAndEmailToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :address, :text
    add_column :carts, :email, :string
  end
end
