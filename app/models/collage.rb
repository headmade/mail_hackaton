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
      img << Magick::Image.read(image.image.path).first
    end
    bg.composite!(img[0], 75, 60, Magick::OverCompositeOp)
    bg.composite!(img[1], 850, 60, Magick::OverCompositeOp)
    bg.composite!(img[2], 75, 766, Magick::OverCompositeOp)
    bg.composite!(img[3], 850, 766, Magick::OverCompositeOp)
    bg.write(file)
    self.image = File.open(file)
  end
end
