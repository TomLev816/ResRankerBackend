class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :username
      t.integer :restaurants_visited
      t.string :image_src
      t.integer :total_restaurants_ranked

      t.timestamps
    end
  end
end
