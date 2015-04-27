class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :images, through: :idea_images 
  has_many :idea_images
  
  validates :title, presence: true
  validates :description, presence: true
end