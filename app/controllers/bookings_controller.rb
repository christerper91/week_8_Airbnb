class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @days = (@booking.end_date - @booking.start_date)/(60*60*24)
    #to access data booking from room
    @room = @booking.room
    @total = @days*@room.rate
    @photo = @room.photos.first
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
