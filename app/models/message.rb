class Message < ApplicationRecord
  belongs_to :job
  validates :content, presence: true
  validates :job_id, presence: true
end
