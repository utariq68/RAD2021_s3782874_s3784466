class RemoveTimesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :times
  end
end
