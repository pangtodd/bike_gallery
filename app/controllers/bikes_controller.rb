class BikesController < ApplicationController

  def index
    @bikes = Bike.all
    render :index
  end

  def home
    @bike = Bike.all
    render :home
  end

  def new
    @bike = Bike.new
    render :new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      flash[:notice] = "Bike successfully added!"
      redirect_to bike_path
    else
      render :new
    end
  end

  def edit
    @bike = Bike.find(params[:id])
    render :edit
  end

  def show
    @bike = Bike.find(params[:id])
    render :show
  end

  def update
    @bike = Bike.find(params[:id])
    if @bike.update(bike_params)
      redirect_to bike_path
    else
      render :edit
    end
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to bike_path
  end

  private
  def bike_params
    params.require(:bike).permit(:name, :make, :model, :category, :size, :year, :descrption, :color, :status, :price)
  end
end