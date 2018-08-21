class Talent < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :messages, through: :job

  validates :name, presence: true
  validates :user_id, presence: true
end
