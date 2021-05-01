class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.string :category
      t.integer :price
      t.string :image
      t.string :list

      t.timestamps
    end
  end
end
