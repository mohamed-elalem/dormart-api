class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :customer_id
      t.timestamps
    end

    add_index :carts, :customer_id
  end
end
