class MessagesController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @messages = @job.messages
  end

  def new
    @job = Job.find(params[:job_id])
    @message = Message.new
    # @message = @conversation.messages.new
  end

  def create
    @message = Message.new(message_params)
    @message.job = Job.find(params[:job_id])
  #  @message = @conversation.messages.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
