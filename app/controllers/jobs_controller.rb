class JobsController < ApplicationController
  before_action :set_job, only: [:show, :set_supplier]
  before_action :set_supplier, only: [:new, :create, :update]

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
    authorize @job
    @message = Message.new
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
      Message.create(sender: "#{current_user.first_name} #{current_user.last_name}", job: @job, content: params[:message_content])
      redirect_to @job
    else
      render :new
    end
  end

  def update
    authorize @job
    @job.update!(job_params)
    redirect_to job_path(@job)
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def set_supplier
    @job = Job.find(params[:id])
    @supplier = @job.talent.user
  end

  def job_params
    params.require(:job).permit(:price, :talent_id, :audio_file, :audio_file_cache, :accepted, :completed, :paid)
  end
end
