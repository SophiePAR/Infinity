class Tombstone < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :user_tombstones
  has_many :messages, dependent: :destroy
  has_many :users, through: :user_tombstones

  validates :first_name, :last_name, :latitude, :longitude, presence: true
end
