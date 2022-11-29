class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :orders
  has_many :user_tombstones
  has_many :tombstones, through: :user_tombstones

  validates :first_name, :last_name, :phone, presence: true

end
