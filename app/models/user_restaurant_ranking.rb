class UserRestaurantRanking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :visits
end
