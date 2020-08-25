class AddReviewIdToRates < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :review_id, :integer
    add_index :rates, :review_id
  end
end
