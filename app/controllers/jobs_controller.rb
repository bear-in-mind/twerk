class JobsController < ApplicationController

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
    @user = current_user
    @message = Message.new

    # @supplier = @job.talent.user
    # to be removed (for testing only):
    suppliers = User.all
    @supplier = suppliers[0]
  end

  def create
    @jobs_as_client = policy_scope(Job)
    @jobs_as_supplier = policy_scope(Job)
    raise
    authorize current_user
    authorize @job
    # @job = Job.new[job_params]
    suppliers = User.all
    @supplier = suppliers[0]
    redirect_to show_profile_path(@supplier)
    # if @job.save
    #   redirect_to @job
    # else
    #   render :new
    # end
  end

  private

  def job_params
    params.require(:job).permit(:price, :file, :audio_file)
  end
end
