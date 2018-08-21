class ExperiencesController < ApplicationController
before_action :set_experience, only: [:edit, :update, :destroy]

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = User.find(params[:id])
    authorize @experience
    @experience.save
    redirect_to(show_profile_path(params[:id]))
  end

  def edit
    authorize @experience
  end

  def update
    authorize @experience
    redirect_to(show_profile_path(params[:id])) if @experience.update(experience_params)
  end

  def destroy
    authorize @experience
    @experience.destroy
    redirect_to(show_profile_path(params[:id]))
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :content, :link_to_album, )
  end

  def set_experience
    Experience.find(params[:id])
  end
end
