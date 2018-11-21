class CreateUserRestaurantRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_restaurant_rankings do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :ranking

      t.timestamps
    end
  end
end
