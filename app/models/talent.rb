class Talent < ApplicationRecord
  include PgSearch

  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :messages, through: :job

  validates :name, presence: true
  validates :user_id, presence: true
end
