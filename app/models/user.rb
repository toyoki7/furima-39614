class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family1, presence: true
  validates :name1, presence: true
  validates :family2, presence: true
  validates :name2, presence: true
  validates :birth, presence: true
  
end
