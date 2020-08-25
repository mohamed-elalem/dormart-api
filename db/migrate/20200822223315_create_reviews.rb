class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.integer :customer_id
      t.integer :product_id
      t.timestamps
    end
    add_index :reviews, :customer_id
    add_index :reviews, :product_id
  end
end
