class Review < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: (0..5) }
  validates :user_id, presence: true
end
