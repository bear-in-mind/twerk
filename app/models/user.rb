class User < ApplicationRecord
  include PgSearch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :jobs
  has_many :talents
  has_many :messages

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :talents, dependent: :destroy

  mount_uploader :avatar, PhotoUploader
  mount_uploader :banner, BannerUploader

  pg_search_scope :global_search,
      against: [ :first_name, :last_name],
      associated_against: {
        talents: [ :name ]
      },
      using: {
        tsearch: { prefix: true }
      }

  pg_search_scope :city_search,
      against: [ :city],
      using: {
        tsearch: { prefix: true }
      }
end
