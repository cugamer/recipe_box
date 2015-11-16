class Recipie < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 1000 }
end
