class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity
      t.integer :shop_id
      t.integer :category_id
      t.timestamps
    end

    add_index :products, :shop_id
    add_index :products, :category_id
  end
end
