class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def index
    @all_users = User.all

    @profiles = policy_scope(User)

    @users_one_search = User.one_search(params["query"])

    @users_by_genre = User.genre_search(params["genre-query"])
    @users_by_city = User.city_search(params["city-query"])
    @users_by_main_criterias = User.global_search(params["main-query"])
    @users_main_talent = @users_by_main_criterias.select do |user|
       user.talents.first.name == params["main-query"]
    end
    @users_other_talent = @users_by_main_criterias - @users_main_talent

    @users_by_city_and_genre = @users_by_city.genre_search(params["genre-query"])
    @users_by_city_and_main = @users_by_city.global_search(params["main-query"])
    @users_by_genre_and_main = @users_by_genre.global_search(params["main-query"])
    @users_by_city_genre_and_main = @users_by_city_and_genre.global_search(params["main-query"])

    @users_by_city_and_main_main_talent = @users_by_city_and_main.select do |user|
       user.talents.first.name == params["main-query"]
    end
    @users_by_city_and_main_other_talent = @users_by_city_and_main - @users_by_city_and_main_main_talent

    @users_by_genre_and_main_main_talent = @users_by_genre_and_main.select do |user|
       user.talents.first.name == params["main-query"]
    end
    @users_by_genre_and_main_other_talent = @users_by_genre_and_main - @users_by_genre_and_main_main_talent

    @users_by_city_genre_and_main_main_talent = @users_by_city_genre_and_main.select do |user|
       user.talents.first.name == params["main-query"]
    end
    @users_by_city_genre_and_main_other_talent = @users_by_city_genre_and_main - @users_by_city_genre_and_main_main_talent
  end

  def show
    authorize current_user
    @profile = User.find(params[:id])
    @review = Review.new
    @review.user_id = params[:id]
    @markers = [{ lat: @user.latitude, lng: @user.longitude }]
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
