# frozen_string_literal: true

class HomeBannerComponent < ViewComponent::Base

  def initialize(banner:, count:)
    @banner = banner
    @count = count
  end

  def render?
    @banner.present? && @banner.visible?
  end

  class ImageComponent < ViewComponent::Base
  	def initialize(image:)
  		@image = image
  	end

    def render?
      @image.attached?
    end
  end

  class BodyComponent < ViewComponent::Base
  	def initialize(title:, body:)
  		@title = title
      @body = body
  	end

    def render?
      @title.present? || @body.present?
    end
  end
end
