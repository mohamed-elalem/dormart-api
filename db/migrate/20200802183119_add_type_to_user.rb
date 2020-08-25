class AddTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string
    add_index :users, :type
  end
end
