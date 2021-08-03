module ApplicationHelper
  # for pagy pagination
  include Pagy::Frontend
  
  def object_to_table_cells(record, attrs)
    attrs.map{ |attr| record.send(attr) }
  end

  def this_year
    current_year = Date.today.year
  end

  def svg(path)
    File.open("app/assets/images/recortes/#{path}", "rb") do |file|
      raw file.read
    end
  end

end

