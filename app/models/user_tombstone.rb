class UserTombstone < ApplicationRecord
  belongs_to :user
  belongs_to :tombstone
end
