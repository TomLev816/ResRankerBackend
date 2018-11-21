class Api::V1::UserRestaurantRankingsController < ApplicationController

  def index
    @user_restaurant_rankings = UserRestaurantRanking.all
    render json: @user_restaurant_rankings
  end

  def show
    @user_restaurant_ranking = UserRestaurantRanking.find(params[:id])
    render json: @user_restaurant_ranking
  end

  def new
    @user_restaurant_ranking = UserRestaurantRanking.new
  end

  def create
    @user_restaurant_ranking = UserRestaurantRanking.create(user_restaurant_ranking_params)
    render json: @user_restaurant_ranking, status: :created
  end

  def edit
    @user_restaurant_ranking = UserRestaurantRanking.find(params[:id])
  end

  def update
    @user_restaurant_ranking = UserRestaurantRanking.find(params[:id])
    @user_restaurant_ranking.update(user_restaurant_ranking_params)
    render json: @user_restaurant_ranking, status: :updated
  end

  def destroy
    @user_restaurant_ranking = UserRestaurantRanking.find(params[:id])
    @user_restaurant_ranking.destroy
    head :no_content
  end

  private

  def user_restaurant_ranking_params
    params.permit(:user_id, :restaurant_id, :ranking)
  end


end
