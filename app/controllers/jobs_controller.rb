class JobsController < ApplicationController
  before_action :set_job, only: [:show]

  def index
    @jobs_as_client = current_user.jobs
    @jobs_as_supplier = current_user.talents.jobs
  end

  def show
    @supplier = @job.talent.user
    @client = @job.user
    @price = @job.price
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
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
    params.require(:job).permit(:price)
  end
end
