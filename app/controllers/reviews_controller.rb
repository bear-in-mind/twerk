class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.job = Job.find_by(user_id: current_user, talent_id: Talent.find_by(user: @review.user))
    @review.save!
    redirect_to(profile_path(params['review'][:user_id]))
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id, :job_id)
  end
end

