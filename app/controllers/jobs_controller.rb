class JobsController < ApplicationController

  def index
    @jobs_as_client = policy_scope(Job)
    @jobs_as_supplier = policy_scope(Job)

    @my_talents = current_user.talents
    @jobs_as_supplier = []
    @my_talents.each do |talent|
      @jobs_as_supplier << talent.jobs
    end

    @jobs = Job.all
    @jobs_as_client = []
    @jobs.each do |job|
      if (job.user_id == current_user.id)
        @jobs_as_client << job
      end
    end
    @jobs_as_client.flatten!

    @jobs_as_supplier.flatten!
  end

  def show
    @job = Job.find(params[:id])
    authorize @job
    @message = Message.new
    @supplier = @job.talent.user
    @client = @job.user
    @price = @job.price
  end

  def new
    @job = Job.new
    authorize @job
    @supplier = User.find(params[:profile_id])
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
    @job = Job.find(params[:id])
    authorize @job
    @supplier = @job.talent.user
    @job.update!(job_params)
    redirect_to job_path(@job)
  end

  private

  def job_params
    params.require(:job).permit(:price, :talent_id, :audio_file, :audio_file_cache, :accepted, :completed, :paid)
  end
end
