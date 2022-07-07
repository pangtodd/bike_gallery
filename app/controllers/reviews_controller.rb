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
      flash[:alert] = "Oops..looks like there was an error in creating your review. Try again."
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
      flash[:notice] = "Review sucessfully updated"
      redirect_to bike_path(@review.bike)
    else
      flash[:alert] = "Oops..looks like there was an error in updating your review. Try again."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Review successfully deleted"
    redirect_to bike_path(@review.bike)
    else
      flash[:alert] = "Oops..Looks like there was an error in deleting your bike. Try again."
      render :show
    end
  end

  private
  def review_params
    params.require(:review).permit(:author, :content, :rating)
  end
end