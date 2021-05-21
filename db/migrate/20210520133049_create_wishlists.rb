class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.string :title
      t.string :body
      t.string :category
      t.integer :price
      t.string :image
      t.string :list
      t.integer :popularity

      t.timestamps
    end
  end
end
