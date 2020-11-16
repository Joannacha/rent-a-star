class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatabl
  has_many :stars, :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
end
