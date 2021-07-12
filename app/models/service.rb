class Service < ApplicationRecord
  has_one_attached :image
  has_rich_text :description
  
  has_many :service_items
end
