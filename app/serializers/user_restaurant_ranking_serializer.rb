class UserRestaurantRankingSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :user_id, :ranking
  # belongs_to :user
  has_many :visits
end
