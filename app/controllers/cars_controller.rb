class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    if @car.save
      redirect_to car_path(@car), notice: "🎉 Your car has been born! 🚗💨 It's a beautiful bouncing baby car! 🤩👶🏼"
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:name, :fuel, :make, :seats)
  end
end
