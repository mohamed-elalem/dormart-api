class CreateCartProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity
      t.timestamps
    end

    add_index :cart_products, [:product_id, :cart_id], unique: true
  end
end
