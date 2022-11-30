class Order < ApplicationRecord

  include AASM

  aasm do
    progress :pending, initial: true
    progress :accepted, :validated, :finished

    event :declare_accepted do
      transitions from: :pending, to: :accepted
    end

    event :declare_validated do
      transitions from: :accepted, to: :validated
    end

    event :declare_finished do
      transitions from: :validated, to: :finished
    end
  end

  belongs_to :user, optional: true

  belongs_to :tombstone
  has_many :order_items, dependent: :destroy
  has_many :prestations, through: :order_items
end
