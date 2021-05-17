class CreateBags < ActiveRecord::Migration[5.2]
  def change
    create_table :bags do |t|
      t.string :title
      t.text :body
      t.string :category
      t.integer :price
      t.string :image
      t.string :size
      t.string :color
      t.integer :quantity
      t.string :user

      t.timestamps
    end
  end
end
