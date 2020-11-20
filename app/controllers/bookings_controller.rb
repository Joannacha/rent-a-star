class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_star, only: :create
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    @booking.star = @star
    authorize @booking
    authorize @star, :show?  # w/o :show we would use the create? method of StarPolicy ?

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render 'stars/show'
    end
  end

  def my_bookings
    #@bookings = Booking.where(user_id: current_user.id)
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
  end

  def my_listings
    @bookings = policy_scope(Booking).where("stars.user_id = #{current_user.id}")
  end

  def show
    @review = @booking.reviews.new
    authorize @review, :create? # w/o :create we would use the show? method of ReviewPolicy ?
  end

  def destroy
    authorize @booking
    @booking.destroy
    # redirect on my_bookings or on my_listings depending on who deleted the booking
    redirect_to star_path(@booking.star), notice: 'Booking was successfully destroy'
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
