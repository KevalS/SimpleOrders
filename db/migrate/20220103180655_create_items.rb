class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :cart
      t.belongs_to :product
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
