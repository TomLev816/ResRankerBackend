class VisitSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :restaurant_id, :date, :comment, :meal_eaten, :image_url

  include Rails.application.routes.url_helpers


  def image_url
    return rails_blob_url(object.image)
  end
  # belongs_to :user
  # has_one :user, through: :user_restaurant_ranking
  # has_one :restaurant, through: :user_restaurant_ranking
  # belongs_to :user_restaurant_ranking
end
