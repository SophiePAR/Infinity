class User < ApplicationRecord

  has_many :messages, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :user_tombstones, dependent: :destroy
  has_many :tombstones, through: :user_tombstones

  has_one_attached :avatar


  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def find_user_tombstone(tombstone)
    self.user_tombstones.find_by(tombstone: tombstone)
  end

  def avatar_thumbnail
    avatar.variant(resize: "150x150!").processed
  end
end
