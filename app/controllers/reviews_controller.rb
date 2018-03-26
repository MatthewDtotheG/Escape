class ReviewsController < ApplicationController
  def index
    @Reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review = Review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
      Review.destroy(params[:id])
      redirect_to @review
  end

private

  def review_params
    params.require(:review).permit(:content, :buyer_id, :reservation_id)
  end
end
