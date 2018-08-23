class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def index
    @all_users = User.all
    @profiles = policy_scope(User)
    @users = User.global_search(params["query"])
    @users_main_talent = @users.select do |user|
      user.talents.first.name == params["query"]
    end
    @users_other_talent = @users - @users_main_talent
  end

  def show
    authorize current_user
  end

  def edit
    authorize @current_user if @user == current_user
  end

  def update
    current_user.update(user_params)
    authorize current_user
    redirect_to profile_path(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :city, :avatar)
  end
end
