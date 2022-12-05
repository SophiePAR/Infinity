class Tombstone < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :user_tombstones
  has_many :messages, dependent: :destroy
  has_many :users, through: :user_tombstones

  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :first_name, :last_name, presence: true
end
