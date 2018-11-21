class Restaurant < ApplicationRecord
  has_many :visits
  has_many :user_restaurant_rankings
  has_many :users, through: :visits
  has_many :users, through: :user_restaurant_rankings
end
