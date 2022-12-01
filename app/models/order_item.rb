class OrderItem < ApplicationRecord
  belongs_to :prestation
  belongs_to :order

  validates :price, presence: true
end
