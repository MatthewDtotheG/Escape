class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(buyer_id: params[:user_id])
  end

  def new
    @buyer_id = params[:buyer_id].to_i
    @reservation_id = params[:reservation_id].to_i
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to user_reviews_path(params[:review][:buyer_id])
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating, :buyer_id, :reservation_id)
  end
end
