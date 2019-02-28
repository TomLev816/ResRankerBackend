class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: @user, status: :created
    else
      render json: {error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   head :no_content
  # end

  private

  def user_params
    params.permit(:first, :last, :username, :password_digest, :visit_count, :image_src, :restaurants_ranked)
  end

end
