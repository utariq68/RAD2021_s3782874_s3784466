class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.string :category
      t.integer :price
      t.string :image
      t.string :list
      t.integer :popularity

      t.timestamps
    end
  end
end
