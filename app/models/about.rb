class About < ApplicationRecord
  include TextEffects

  has_one_attached :image 
end
