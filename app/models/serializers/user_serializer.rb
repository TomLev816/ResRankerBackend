class UserSerializer < ActiveModel::Serializer
  attributes :id, :first, :last, :username, :restaurants_visited, :image_src, :total_restaurants_ranked
  has_many :visits
  has_many :user_restaurant_rankings
  has_many :restaurants, through: :visits
  has_many :restaurants, through: :user_restaurant_rankings
end
