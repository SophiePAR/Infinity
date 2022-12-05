class MessagesController < ApplicationController

  def create
    @tombstone = Tombstone.find(params[:tombstone_id])
    @message = Message.new(message_params)
    @message.tombstone = @tombstone
    @message.user = current_user
    if @message.save
      redirect_to tombstone_path(@tombstone)
    else
      render "tombstobne/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
