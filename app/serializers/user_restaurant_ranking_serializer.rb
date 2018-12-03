class UserRestaurantRankingSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :user_id, :ranking
end
