class Api::V1::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    render json: @restaurant, status: :created
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    render json: @restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    head :no_content
  end

  private

  def restaurant_params
    params.permit(:name, :address, :cuisine, :location_lat, :location_long, :visitors, :image_src)
  end

end
