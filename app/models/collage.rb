class Collage < ActiveRecord::Base
  mount_uploader :image, CollageUploader

  belongs_to :user
  after_validation :compose

  def compose
    require 'RMagick'
    file = Rails.root.join('tmp', 'col.png')
    bg = Magick::Image.read('app/assets/images/bg.png').first
    images = Image.find(photos.split(','))
    img = []
    images.each do |image|
      img << Magick::Image.read(image.image.thumb.path).first
    end
    bg.composite!(img[0], 0, 0, Magick::OverCompositeOp)
    bg.composite!(img[1], 150, 0, Magick::OverCompositeOp)
    bg.composite!(img[2], 0, 150, Magick::OverCompositeOp)
    bg.composite!(img[3], 150, 150, Magick::OverCompositeOp)
    bg.composite!(img[4], 75, 75, Magick::OverCompositeOp)
    bg.write(file)
    self.image = File.open(file)
  end
end
