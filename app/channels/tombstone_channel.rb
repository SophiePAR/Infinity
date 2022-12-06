class TombstoneChannel < ApplicationCable::Channel
  def subscribed
    tombstone = Tombstone.find(params[:id])
    stream_for tombstone
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
