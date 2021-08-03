# frozen_string_literal: true

class GalleryComponent < ViewComponent::Base
  attr_reader :galleries 
  
  def initialize(galleries:)
    @galleries = galleries
  end

  def render?
    @album.present?
  end
end
