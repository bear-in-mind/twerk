class Message < ApplicationRecord
  belongs_to :job
  belongs_to :user
  validates :content, presence: true
  validates :job_id, presence: true
end
