class CreateForgots < ActiveRecord::Migration[5.2]
  def change
    create_table :forgots do |t|
      t.string :email

      t.timestamps
    end
  end
end
