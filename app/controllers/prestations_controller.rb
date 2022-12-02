class PrestationsController < ApplicationController
  def create
    if @prestation.title == 'Autres'
  end
  #   @prestation = Prestation.new(order_params)
  #   if @prestation.save
  #     redirect_to order_item_path(@prestation)
  #   else
  #     render new, status: :unprocessable_entity
  #   end
  # end

  # private

  # def prestation_params
  #   params.require(:prestation).permit(:title, :price, :content)
  # end
end
