class MessagesController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @messages = @job.messages
  end

  def new
    @job = Job.find(params[:job_id])
    @message = Message.new
    authorize @message
    # @message = @conversation.messages.new
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.job = Job.find(params['message'][:job_id])
    sender = current_user
    @message.sender = "#{sender.first_name} #{sender.last_name}"
  #  @message = @conversation.messages.new(message_params)
    @message.save!
    redirect_to job_path(@message.job)
  end

  private

  def message_params
    params.require(:message).permit(:content, :job_id)
  end
end
