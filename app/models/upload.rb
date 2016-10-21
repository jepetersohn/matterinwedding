require_relative 'resizer'

class Upload < ActiveRecord::Base
  include Resizer
  validates :link, :description, presence: true

  def resizeimage
    kobject = self.start_kraken

    params = {
    :wait => true,
    :resize => {
        'width' => 250,
        'height' => 250,
        'strategy' => 'auto'
                }
              }

    data = kobject.url(self.link, params)
    cracked_url(data)
  end

  def cracked_url(data)
    if data.success
      puts 'Success! Optimized image URL: ' + data.kraked_url
    else
      puts 'Fail. Error message: ' + data.message
    end
  end

  def self.fix_all_images
    self.all.each do |image|
      image.resizeimage
    end
  end


end
