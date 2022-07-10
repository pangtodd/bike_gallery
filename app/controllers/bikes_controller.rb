class BikesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :edit, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end
  
  def index
    @bikes = Bike.all
    render :index
  end

  def home
    render :home
  end

  def new
    @bike = Bike.new
    render :new
  end

  def create
    @bike = Bike.new(bikes_params)
    if @bike.save
      flash[:notice] = "Bike successfully added!"
      redirect_to bikes_path
    else
      flash[:alert] = "Oops..Looks like there was an error in creating your bike. Try again."
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
    if @bike.update(bikes_params)
      flash[:notice] = "Bike successfully updated"
      redirect_to bikes_path
    else
      flash[:alert] = "Oops..Looks like there was an error in updating your bike. Try again."
      render :edit
    end
  end

  def destroy
    @bike = Bike.find(params[:id])
    if @bike.destroy
      flash[:notice] = "Product successfully deleted"
    redirect_to bikes_path
    else
      flash[:alert] = "Oops..Looks like there was an error in deleting your bike. Try again."
      render :show
    end
  end
  
  def attach()
    @bike = Bike.find(params[:id])
    @bike.bike_photo.attach(params[:bike][:bike_photo])
  end

  private
  def bikes_params
    params.require(:bike).permit(:name, :make, :model, :category, :size, :year, :description, :color, :status, :price, :bike_photo)
  end
end