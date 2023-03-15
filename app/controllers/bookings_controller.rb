class BookingsController < ApplicationController
  before_action :set_car, only: [:new, :create, :update, :show, :accept, :decline]

  def index
    @user_bookings = current_user.bookings
    @owner_bookings = current_user.cars.map(&:bookings).flatten
    @feedbacked_bookings = Feedback.where(user_id: current_user.id).pluck(:booking_id)
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: 'accepted')
    @booking.save
    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: 'declined')
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date_from, :date_to)
  end

  def set_car
    @car =
      if params[:action] == 'new' || params[:action] == 'create'
        Car.find(params[:car_id])
      else
        Booking.find(params[:id]).car
      end
  end
end
