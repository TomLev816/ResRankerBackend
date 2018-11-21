class Api::V1::VisitsController < ApplicationController

  def index
    @visits = Visit.all
    render json: @visits
  end

  def show
    @visit = Visit.find(params[:id])
    render json: @visit
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.create(visit_params)
    render json: @visit, status: :created
  end

  def edit
    @visit = Visit.find(params[:id])
  end

  def update
    @visit = Visit.find(params[:id])
    @visit.update(visit_params)
    render json: @visit, status: :updated
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    head :no_content
  end

  private

  def visit_params
    params.permit(:user_id, :restaurant_id, :date, :comment)
  end

end
