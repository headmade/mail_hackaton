class Collage < ActiveRecord::Base
  mount_uploader :image, CollageUploader

  belongs_to :user

  def compose
    require 'RMagick'
    bg = Magick::Image.read('app/assets/images/bg.png').first
    img1 = Magick::Image.read(Image.first.image.path).first
    bg.composite!(img1, 50, 50, Magick::OverCompositeOp)
    image = bg
  end
end
