class UserRestaurantRankingSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :user_id, :ranking
  belongs_to :users
  belongs_to :restaurants
end
