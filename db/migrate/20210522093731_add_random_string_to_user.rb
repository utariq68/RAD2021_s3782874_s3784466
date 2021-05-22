class AddRandomStringToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :times, :integer
  end
end
