class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_star, only: [:create, :destroy]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.star = @star
    @booking.user = current_user
    if @booking.save
      redirect_to star_path(@star), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def my_booking
    @bookings = Booking.where(:user_id == current_user)
  end

  def my_listing
    @my_star = Star.where(:user_id == current_user)
    @bookings = Booking.where(:star_id == @my_star)
  end

  def show
    @review = Review.new
  end

  def destroy
    @booking.destroy
    redirect_to star_path(@star), notice: 'Booking was successfully destroy'
  end

  private

  def set_star
    @star = Star.find(params[:star_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
