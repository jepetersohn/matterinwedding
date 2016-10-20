class Upload < ActiveRecord::Base
  validates :link, :description, presence: true


end
