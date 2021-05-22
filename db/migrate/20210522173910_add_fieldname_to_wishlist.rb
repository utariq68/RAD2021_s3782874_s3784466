class AddFieldnameToWishlist < ActiveRecord::Migration[5.2]
  def change
    add_column :wishlists, :email, :string
  end
end
