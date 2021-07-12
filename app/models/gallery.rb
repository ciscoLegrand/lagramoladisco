class Gallery < ApplicationRecord
  has_many_attached :images
  belongs_to :album
end
