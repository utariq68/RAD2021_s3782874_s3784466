class RemoveBagFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :bag
  end
end
