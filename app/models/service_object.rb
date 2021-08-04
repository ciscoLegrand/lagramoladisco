class ServiceObject < ApplicationRecord
  belongs_to :service
  has_many_attached :images
  has_rich_text :description
  
  delegate :name, to: :service, prefix: :service

  acts_as_list scope: :service
  default_scope { order(position: :asc) }
end
