class Recipie < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 1000 }
  
  
  has_attached_file :photo, styles: { medium: "400x400>", thumb: "150x150>" },
                                      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
