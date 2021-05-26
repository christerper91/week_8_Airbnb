class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build(bookings_params)
  end

  private

  def bookings_params
    params.require(:booking).permit(:user, :room, :start_date, :end_date)
  end
end
