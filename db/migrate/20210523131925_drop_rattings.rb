class DropRattings < ActiveRecord::Migration[5.2]
  def change
    drop_table :rattings
  end
end
