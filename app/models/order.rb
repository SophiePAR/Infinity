class Order < ApplicationRecord
  has_one_attached :photo
  include AASM
  aasm.attribute_name :progress

  aasm do
    state :pending, initial: true
    state :accepted, :validated, :finished

    event :declare_accepted do
      transitions from: :pending, to: :accepted
    end

    event :declare_validated do
      transitions from: :accepted, to: :validated
    end

    event :declare_finished do
      transitions from: :validated, to: :finished
    end

    event :declare_refused do
      transitions from: :accepted, to: :pending
    end
  end

  belongs_to :user, optional: true
  belongs_to :tombstone
  has_many :order_items, dependent: :destroy
  has_many :prestations, through: :order_items

  # validates :date, presence: true

  def go_to_next_step
    case self.aasm.current_state
      when :pending then self.declare_accepted
      when :accepted then self.declare_validated
      when :validated then self.declare_finished
      else
    end
  end

  def go_back
    self.declare_refused
  end
end
