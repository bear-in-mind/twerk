class Review < ApplicationRecord
  belongs_to :user
  has_one :job

  validates :content, presence: true
  # validates :rating, presence: true, inclusion: { in: (0..5) }
  validates :user_id, presence: true
end
