class Image < ActiveRecord::Base
  validates :title, presence: true
  has_many :idea_images
  has_many :ideas, through: :idea_images
  has_attached_file :attachment
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
