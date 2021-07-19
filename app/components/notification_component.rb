# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  def initialize(type:, data:)
    @type = type
    @data = prepare_data(data)
    @icon_class = icon_class
    @color_class = color_class
  end

  def icon_class
    case @type
    when 'notice'
      'fa-check-square has-text-success'
    when 'error'
      'fa-ban has-text-danger'
    when 'alert'
      'fa-exclamation-triangle has-text-warning'
    else
      'fa-info-circle has-text-info'
    end
  end
  
  def color_class
    case @type
    when 'notice'
      'success'
    when 'error'
      'error'
    when 'alert'
      'alert'
    else
      'info'
    end
  end

  private

  def prepare_data(data)
    case data
    when Hash
      @data
    else  
      {title: data}
    end
  end

end
