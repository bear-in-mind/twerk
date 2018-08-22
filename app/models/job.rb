class Job < ApplicationRecord
  belongs_to :user
  belongs_to :talent
  has_many :messages

  validates :price, presence: true
  validates :user_id, presence: true
  validates :talent_id, presence: true

  mount_uploader :audio_file, MusicUploader

end
