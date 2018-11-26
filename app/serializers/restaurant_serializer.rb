class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :cuisine, :location_lat, :location_long, :visitors, :image_src
  has_many :user_restaurant_rankings
  # has_many :users, through: :user_restaurant_rankings
  # has_many :visits, through: :user_restaurant_rankings
end
