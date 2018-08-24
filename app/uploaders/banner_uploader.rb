
# app/uploaders/photo_uploader.rb
class BannerUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :banner_image do
    cloudinary_transformation width: 1065, height: 350, crop: :fill, gravity: :auto, border: "3px_solid_white"
  end

end
