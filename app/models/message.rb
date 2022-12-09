class Message < ApplicationRecord
  belongs_to :user
  belongs_to :tombstone

  # validates :content, presence: true
  # validates :content, length: { minimum: 2 }
end
