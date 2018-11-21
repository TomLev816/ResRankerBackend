class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :cuisine
      t.float :location_lat
      t.float :location_long
      t.integer :visitors
      t.string :image_src

      t.timestamps
    end
  end
end
