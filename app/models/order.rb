class Order < ApplicationRecord
  belongs_to :user
  belongs_to :tombstone
  has_many :order_items
  has_many :prestations, through: :order_items
end
