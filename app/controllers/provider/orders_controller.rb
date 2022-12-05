class Provider::OrdersController < ApplicationController
  def index
    @orders = Order.where(progress: "pending")
  end

  def show
    @order = Order.find(params[:id])

    @tombstonesmap = Tombstone.all
    @markers = @tombstonesmap.map do |tombstonemap|
      {
        lat: tombstonemap.latitude,
        lng: tombstonemap.longitude
      }
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(user: current_user)
    @order.go_to_next_step
    @order.save
    redirect_to my_missions_path
    # case @order.aasm.current_state
    #   when "pending" then @order.declare_accepted
    #   when "accepted" then @order.declare_validated
    #   when "validated" then @order.declare_finished
    #   else
    # end
    # raise
  end
end
