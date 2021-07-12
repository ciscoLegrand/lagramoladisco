class Album < ApplicationRecord
  # has_many :photos, dependent: :destroy
  # has_many_attached :images
  has_many :galleries, dependent: :destroy

  scope :recientes, -> { order('created_at DESC') } #ordena por fecha de creación mas reciente
  scope :date, -> { order('date_event DESC') } #ordena por fecha de creación mas recient
  scope :title, -> (title) { where("title LIKE ?", "%#{title}%") } #obtiene coincidencias por titulo
end
