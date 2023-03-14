class BookingsController < ApplicationController
  before_action :set_car, only: [:new, :create, :update, :show]

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = @car.bookings.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car

    if @booking.save
      redirect_to car_path(@car), notice: "Booking created successfully."
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
