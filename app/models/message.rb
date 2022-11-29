class Message < ApplicationRecord
  belongs_to :user
  belongs_to :tombstone

  validates :content, presence: true
end
