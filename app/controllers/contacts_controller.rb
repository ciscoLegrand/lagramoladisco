class ContactsController < ApplicationController 
  def index
    add_breadcrumb 'Email Contacto'
    @headers = ['NOMBRE','EMAIL','TELEFONO','CABINAS','MAS SERVICIOS','RESTAURANTE','FECHA', 'ASUNTO']
    @attrs =  [:name,:email,:phone, :service_name,  :additional_services, :restaurant_name,:date_event,  :title]
    @pagy, @contacts = pagy(Contact.all, items: 10)
  end

  def new 
    @contact = Contact.new 
  end

  def create
    @contact = Contact.new(contacts_params)

    respond_to do |format|
      if @contact.save   
        InfoMailer.form_contact(@contact).deliver
        format.html { redirect_to root_path, notice: 'Correo enviado correctamente, en breve recibiras tu respuesta' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(:name,:email,:phone,:service_name, :additional_services, :restaurant_name,:observations_info, :date_event,:title, :body)
  end
end