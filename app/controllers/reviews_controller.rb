class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = User.find(params[:id])
    authorize @review
    redirect_to(show_profile_path(params[:id]))
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
