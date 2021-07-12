# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  with_collection_parameter :service
  renders_one :image, "ImageComponent"

  def initialize(service:, service_counter:)
    @service = service
    @counter = service_counter
  end

  class LinkConmponent < ViewComponent::Base
    def initialize(href:, name:)
      @href = href
      @name = name
    end
  end

  class ImageComponent < ViewComponent::Base
  	def initialize(image:, href:)
  		@image = image
      @href = href
  	end

    def render?
      @image.attached?
    end
  end

  class MediaContentComponent < ViewComponent::Base
  	def initialize(title:, body:)
  		@title = title
      @body = body
  	end

    def render?
      @title.present? || @body.present?
    end
  end

  class PriceTagComponent < ViewComponent::Base
    def initialize(price:)
      @price = price
    end
    def render?
      @price.present?
    end
  end
end
