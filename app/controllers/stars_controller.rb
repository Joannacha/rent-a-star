class StarsController < ApplicationController
  before_action :set_star, only: [:show, :update, :destroy, :edit]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index
    @stars = policy_scope(Star)
  end

  def show
    @booking = Booking.new
    authorize @star
    authorize @booking, :new?
  end

  def new
    @star = Star.new
    authorize @star
  end

  def create
    @star = Star.new(star_params)
    authorize @star
    @star.user = current_user
    if @star.save
      redirect_to star_path(@star)
    else
      render :new
    end
  end

  def edit
    authorize @star
  end

  def update
    authorize @star
    @star.update(star_params)
    redirect_to star_path(@star)
  end

  def destroy
    authorize @star
    @star.destroy
  end

  private

  def set_star
    @star = Star.find(params[:id])
  end

  def star_params
    params.require(:star).permit(:name, :price, photos: [])
  end
end
