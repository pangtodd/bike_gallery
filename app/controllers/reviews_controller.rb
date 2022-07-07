class ReviewsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @review = @bike.reviews.new
    render :new
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @review = @bike.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def show
    @bike = Bike.find(params[:bike_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @bike = Bike.find(params[:bike_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @bike = Bike.find(params[:bike_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to bike_path(@review.bike)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to bike_path(@review.bike)
  end

  private
  def review_params
    params.require(:review).permit(:author, :content, :rating)
  end
end