class TombstoneChannel < ApplicationCable::Channel
  def subscribed
    tombstobne = Tombstone.find(params[:id])
    stream_for tombstobne
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
