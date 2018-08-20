class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :jobs
  has_many :talents

  validates :first_name, presence: true
  validates :last_name, presence: true

end
