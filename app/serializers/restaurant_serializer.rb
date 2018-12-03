class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :cuisine, :location_lat, :location_long, :visitors, :image_src
  has_many :user_restaurant_rankings

  class VisitSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :restaurant_id, :date, :comment, :meal_eaten
  end

end
