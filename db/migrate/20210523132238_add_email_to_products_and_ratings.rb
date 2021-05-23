class AddEmailToProductsAndRatings < ActiveRecord::Migration[5.2]
  def change

    add_column :products, :email, :string
    add_column :ratings, :email, :string
  end
end
