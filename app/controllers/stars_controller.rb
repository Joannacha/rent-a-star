class StarsController < ApplicationController
  before_action :set_star, only: [:show, :update, :destroy, :edit]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @stars = Star.all.order(updated_at: :desc)
  end

  def show
    @booking = Booking.new
  end

  def new
    @star = Star.new
  end

  def create
    @star = Star.new(star_params)
    @star.user = current_user
    if @star.save
      redirect_to star_path(@star)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @star.update(star_params)

    redirect_to star_path(@star)
  end

  def destroy
    @star.destroy
  end

  private

  def set_star
    @star = Star.find(params[:id])
  end

  def star_params
    params.require(:star).permit(:name, :price, :galaxy, :description, photos: [])
  end
end
