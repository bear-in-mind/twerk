class Job < ApplicationRecord
  belongs_to :user
  belongs_to :talent
  has_many :messages, dependent: :destroy

  validates :price, presence: true
  validates :user_id, presence: true
  validates :talent_id, presence: true
end
