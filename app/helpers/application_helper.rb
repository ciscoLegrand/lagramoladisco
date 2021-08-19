module ApplicationHelper
  # for pagy pagination
  include Pagy::Frontend
  
  def object_to_table_cells(record, attrs)
    attrs.map{ |attr| record.send(attr) }
  end

  def this_year
    current_year = Date.today.year
  end

  def default_swal_options
    '{
      "title": "Estás seguro?",
      "text": "Una vez eliminado no podrás recuperar el registro",
      "icon": "warning",
      "showCancelButton": true,
      "confirmButtonText":  "Eliminar",
      "cancelButtonText": "Cancelar",
      "buttonsStyling": false,
      "customClass": {
        "confirmButton": "button is-danger mx-2",
        "cancelButton": "button is-light mx-2"
      }
    }'
  end

end

