class MessagesController < ApplicationController

  def create
    @tombstone = Tombstone.find(params[:tombstone_id])
    @message = Message.new(message_params)
    @message.tombstone = @tombstone
    @message.user = current_user
    if @message.save
      TombstoneChannel.broadcast_to(
        @tombstone,
        render_to_string(partial: "messages/message", locals: { message: @message })
      )
      head :ok
    else
      render "/tombstones/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
