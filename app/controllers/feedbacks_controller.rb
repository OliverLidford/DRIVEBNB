class FeedbacksController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
    @feedback.car = @booking.car
    @feedback.booking = @booking

    if @feedback.save
      redirect_to car_path(@booking.car)
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rating, :content)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
