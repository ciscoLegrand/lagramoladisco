module DateFormat
  extend ActiveSupport::Concern

  def created_format
    self.created_at.strftime("%d-%m-%Y [%H:%M]")
  end

  def date_gallery_format
    self.date_event.strftime("%d-%m-%Y") if self.date_event.present?
  end 
end