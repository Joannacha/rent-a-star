class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stars
  has_many :bookings
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true
end
