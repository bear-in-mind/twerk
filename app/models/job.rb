class Job < ApplicationRecord
  belongs_to :user
  belongs_to :talent

  validates :price, presence: true
  validates :user_id, presence: true
  validates :talent_id, presence: true
end
