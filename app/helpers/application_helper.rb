module ApplicationHelper

  def this_year
    current_year = Date.today.year
  end

  def svg(path)
    File.open("app/assets/images/recortes/#{path}", "rb") do |file|
      raw file.read
    end
  end

end

