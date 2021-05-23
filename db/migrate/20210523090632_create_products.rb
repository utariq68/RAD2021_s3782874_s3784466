class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :body
      t.string :category
      t.integer :price
      t.string :list
      t.string :image

      t.timestamps
    end
  end
end
