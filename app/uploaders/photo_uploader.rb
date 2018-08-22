
# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :profile_picture do
    cloudinary_transformation width: 200, height: 200, crop: :fill, gravity: :face, border: "3px_solid_white"
  end

end
