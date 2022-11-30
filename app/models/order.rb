class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :tombstone
  has_many :order_items, dependent: :destroy
  has_many :prestations, through: :order_items
end
