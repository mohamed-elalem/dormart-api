class ChangeValueInRates < ActiveRecord::Migration[6.0]
  def change
    change_column :rates, :value, :integer
  end
end
