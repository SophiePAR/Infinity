class Tombstone < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :user_tombstones
  has_many :messages, dependent: :destroy
  has_many :users, through: :user_tombstones

  has_one_attached :photo

  validates :first_name, :last_name, presence: true

  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode
end
