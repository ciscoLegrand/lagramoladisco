class HomeBanner < ApplicationRecord
  include TextEffects
  
  has_one_attached   :image
  has_rich_text      :body


end
