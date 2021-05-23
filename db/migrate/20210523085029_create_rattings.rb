class CreateRattings < ActiveRecord::Migration[5.2]
  def change
    create_table :rattings do |t|
      t.integer :score

      t.timestamps
    end
  end
end
