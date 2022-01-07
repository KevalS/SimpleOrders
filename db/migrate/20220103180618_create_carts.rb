class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.belongs_to :user
      t.integer :actual_status, default: 0
      t.timestamps
    end
  end
end
