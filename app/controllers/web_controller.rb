class WebController < ApplicationController
  def web_home
    @home = true
    @banner_uno = HomeBanner.first
    @banner_dos = HomeBanner.second
    @banner_tres = HomeBanner.third
    @awards = Award.first
    @opinions = Opinion.all
    @abouts = About.all
    @about = @abouts.first
  end 

  def web_about_us
    @abouts = About.all
    @about = @abouts.first
  end


  def web_services
    add_breadcrumb 'Servicios', servicios_path
    @services = Service.all
  end

  def web_service
    @service = Service.find(params[:service_id])
    @service_objects = ServiceObject.where(service_id: @service).all
    add_breadcrumb @service.name, servicio_path
  end

  def web_search_results
    add_breadcrumb "Albumes", resultados_path
    if params.has_key?(:title) && params[:title].length > 0
      @albums = Album.title(params[:title])
    else
      @albums = Album.all
    end
  end
  
  def web_albums
    add_breadcrumb "Galerias", galerias_path
    if params.has_key?(:title) && params[:title].length > 0
      @albums = Album.title(params[:title])
    else
      @albums = Album.date.all
    end

    if params.has_key?(:password) && params[:password].length > 0
      @albums = Album.password(params[:password])
    else
      @albums = Album.date.all
    end

  end 

  def web_album
    @album = Album.find(params[:album_id])
    add_breadcrumb @album.title, galeria_path(@album)
    @total_images = 0 
    @album.galleries.each {|gal| @total_images += gal.images.length }
    @password = @album.password

    if params.has_key?(:password) && params[:password].length > 0 && params[:password] == @password
      @album = Album.find(params[:album_id])
      @pagy, @galleries  = pagy(Album.find(params[:album_id]).galleries, items: 10)
    else
      redirect_to galerias_path
    end
  end 
  
  def web_contact
    add_breadcrumb 'Contacto', contacto_path
    @contact = Contact.new
  end
end
