class DropProductIdAndCustomerIdFromRates < ActiveRecord::Migration[6.0]
  def change
    remove_index :rates, :product_id
    remove_index :rates, :customer_id
    remove_column :rates, :product_id
    remove_column :rates, :customer_id
  end
end
