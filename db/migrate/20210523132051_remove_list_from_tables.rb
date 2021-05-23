class RemoveListFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :list
  end
end
