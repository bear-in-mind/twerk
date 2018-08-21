class ProfilesController < ApplicationController

  def index
    authorize current_user
  end

  def show
    authorize current_user
  end

  def edit
    authorize current_user
  end

  def update
    authorize current_user
  end

end
