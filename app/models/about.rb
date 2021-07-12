class About < ApplicationRecord
  has_one_attached :image 
  has_rich_text :content1
  has_rich_text :content2
  has_rich_text :content3
end
