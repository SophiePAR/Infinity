class UserTombstone < ApplicationRecord
  belongs_to :user
  belongs_to :tombstone
  has_many :orders, dependent: :destroy
end
