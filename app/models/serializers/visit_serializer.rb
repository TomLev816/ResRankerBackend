class VisitSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :user_id, :date, :comment
  belongs_to :users
  belongs_to :restaurants
end
