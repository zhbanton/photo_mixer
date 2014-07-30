# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  include CarrierWave::RMagick

  # Fog + Carrierwave = Storage in Amazon S3
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :small_avatar do
    process :resize_to_fill => [45, 45]
  end

  version :large_avatar do
    process :resize_to_fill => [180, 180]
  end

  def default_url
    "default_images/" + [version_name, "eric.jpg"].compact.join('_')
  end

end
