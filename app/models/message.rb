class Message < ApplicationRecord
  belongs_to :user
  belongs_to :job
  
  validates :content, presence: true
  validates :user_id, presence: true
  validates :job_id, presence: true
end
