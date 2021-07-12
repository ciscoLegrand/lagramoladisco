# frozen_string_literal: true

class AlbumComponent < ViewComponent::Base
  with_collection_parameter :albums
 
  def initialize(albums:)
    @albums = albums
  end

  def render?
    @albums.present?
  end
end

