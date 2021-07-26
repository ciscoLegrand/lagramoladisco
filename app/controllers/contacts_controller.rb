class ContactsController < ApplicationController 
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
    params.require(:contact).permit(:title, :body, :email)
  end
end