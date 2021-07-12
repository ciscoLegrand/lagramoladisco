# frozen_string_literal: true

class SocialLinkComponent < ViewComponent::Base
  def initialize(href:, name:, ico:)
    @href = href
    @name = name
    @ico = ico
  end

  def svg(path)
    File.open("app/assets/images/recortes/#{path}", "rb") do |file|
      raw file.read
    end
  end

  def render?
    @href.present?
  end

end
