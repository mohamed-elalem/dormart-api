class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :product_id
      t.integer :customer_id
      t.float :value, default: 0.0
      t.timestamps
    end

    add_index :rates, :product_id
    add_index :rates, :customer_id
  end
end
