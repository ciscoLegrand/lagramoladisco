module DateFormat
  extend ActiveSupport::Concern

  def created_format
    self.created_at.strftime("%d-%m-%Y [%H:%M]")
  end
end