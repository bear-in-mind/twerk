class MusicUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
