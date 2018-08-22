class JobsController < ApplicationController
  before_action :set_job, only: [:show]
  def index
    @jobs = Job.all
  end

  def show
    @supplier = @job.talent.user
    @client = @job.user
    @price = @job.price
  end

  def new
    @job = Job.new
    authorize @job
    @user = current_user
    # @message = Message.new(current_user)
    # @supplier = @job.talent.user
    # to be removed (for testing only):
    suppliers = User.all
    @supplier = suppliers[0]
  end

  def create
    @job = Job.new[job_params]
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.permit(:price, :file, :audio_file)
  end
end
