class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new(room_id: params[:room_id])
  end

  def create
    @booking = current_user.bookings.build(bookings_params)
    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:user, :room_id, :start_date, :end_date)
  end
end
