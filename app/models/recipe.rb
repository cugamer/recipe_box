class Recipe < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 1000 }
  belongs_to :user
  has_many :directions
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  has_many :ingredients
  
  
  has_attached_file :photo, styles: { medium: "400x400>", thumb: "150x150>" },
                                      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
