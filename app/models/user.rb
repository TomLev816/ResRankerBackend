class User < ApplicationRecord
  has_many :user_restaurant_rankings
  has_many :visits, through: :user_restaurant_rankings
  has_many :restaurants, through: :user_restaurant_rankings
end
