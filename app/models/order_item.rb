class OrderItem < ApplicationRecord
  belongs_to :prestation
  belongs_to :order
end
