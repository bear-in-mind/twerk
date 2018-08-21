class ProfilesController < ApplicationController

  def index
    authorize current_user
  end

  def show
    @user = User.find(params[:id])
    authorize current_user
  end

  def edit
    @user = User.find(params[:id])
    authorize @current_user if @user == current_user
  end

  def update
    current_user.update(user_params)
    authorize current_user
    redirect_to show_profile_path(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :city, :avatar)
  end
end
