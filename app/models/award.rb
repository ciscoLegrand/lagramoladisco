class Award < ApplicationRecord
  include TextEffects

  has_many_attached :images
end
