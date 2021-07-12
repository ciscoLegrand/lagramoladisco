class ServiceItem < ApplicationRecord
  belongs_to :service

  has_many_attached :images
  has_rich_text :body
end
