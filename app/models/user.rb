class User < ApplicationRecord
  has_many :events, foreign_key: :creator
  has_many :attendances, foreign_key: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
