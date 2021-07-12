class Award < ApplicationRecord
  has_many_attached :images
  has_rich_text :body
end
