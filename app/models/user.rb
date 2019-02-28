class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :user_restaurant_rankings
  has_many :visits
  has_many :restaurants, through: :user_restaurant_rankings
  has_many :restaurants, through: :visits
end
