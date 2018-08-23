class JobsController < ApplicationController
  before_action :set_supplier, only: [:new, :create]

  def index
    @jobs_as_client = policy_scope(Job)
    @jobs_as_supplier = policy_scope(Job)

    @my_talents = current_user.talents
    @jobs_as_supplier = []
    @my_talents.each do |talent|
      @jobs_as_supplier << talent.jobs
    end
    @jobs_as_supplier.flatten!
  end

  def show
    @job = Job.find(params[:id])
    authorize @job
    @supplier = @job.talent.user
    @client = @job.user
    @price = @job.price
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job
    if @job.save
      Message.create(user: current_user, job: @job, content: params[:message_content])
      redirect_to @job
    else
      render :new
    end
  end

  private

  def set_supplier
    @supplier = User.find(params[:profile_id])
  end

  def job_params
    params.require(:job).permit(:price, :talent_id, :audio_file, :audio_file_cache)
  end
end
