class User < ApplicationRecord
  has_many :visits
  has_many :user_restaurant_rankings
  has_many :restaurants, through: :visits
  has_many :restaurants, through: :user_restaurant_rankings
end
