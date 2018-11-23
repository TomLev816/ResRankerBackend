class UserRestaurantRankingSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :user_id, :ranking
  # belongs_to :user
  # belongs_to :restaurant
end
