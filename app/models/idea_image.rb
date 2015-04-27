class IdeaImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :idea
end