class Gallery < ApplicationRecord
  has_many_attached :images
  belongs_to :album

  delegate :title, :date_event, :wedding_guests, :password, to: :album

  def album_title
    album.title
  end
end
