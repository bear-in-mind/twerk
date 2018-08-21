class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to show_profile_path(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :city, :avatar)
  end
end
