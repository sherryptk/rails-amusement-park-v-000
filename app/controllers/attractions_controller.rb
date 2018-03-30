class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = logged_in
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = logged_in
  end

  def new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def ride
    @user = logged_in
    redirect_to user_path(@user)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def logged_in
    User.find(session[:user_id])
  end

end
