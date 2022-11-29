class Tombstone < ApplicationRecord
  has_many :orders
  has_many :user_tombstones
  has_many :messages
  has_many :users, through: :user_tombstones

  validates :first_name, :last_name, :birth_date, :death_date, :latitude, :longitude, presence: true
end
