class VisitSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :restaurant_id, :date, :comment, :meal_eaten
  # belongs_to :user
  # has_one :user, through: :user_restaurant_ranking
  # has_one :restaurant, through: :user_restaurant_ranking
  # belongs_to :user_restaurant_ranking
end
