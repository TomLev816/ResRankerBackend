class UserSerializer < ActiveModel::Serializer
  attributes :id, :first, :last, :username, :visit_count, :image_src, :restaurants_ranked
  has_many :user_restaurant_rankings
  has_many :visits, through: :user_restaurant_rankings
  has_many :restaurants, through: :user_restaurant_rankings

  class UserRestaurantRankingSerializer < ActiveModel::Serializer
    attributes :id, :restaurant_id, :user_id, :ranking
    has_many :visits

    class RestaurantSerializer < ActiveModel::Serializer
      attributes :id, :name, :address, :cuisine, :location_lat, :location_long, :visitors, :image_src
      has_many :user_restaurant_rankings
    end
  end
end
