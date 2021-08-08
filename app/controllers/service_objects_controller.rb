class ServiceObjectsController < ApplicationController
  before_action :set_service_object, only: %i[ show edit update destroy ]

  # GET /service_objects or /service_objects.json
  def index
    add_breadcrumb 'Servicios', services_path
    @headers = ['NOMBRE', 'DESCRIPCION','POSICION','SERVICIO','PRECIO']

    @attrs =  [:name,:description, :position, :service_name, :price]
    @pagy, @service_objects = pagy(ServiceObject.all, items: 10)
  end

  # GET /service_objects/1 or /service_objects/1.json
  def show
    add_breadcrumb 'Servicios', services_path
    add_breadcrumb @service_object.service_name, service_objects_path
    add_breadcrumb @service_object.name
  end

  # GET /service_objects/new
  def new
    add_breadcrumb 'Servicios', services_path
    add_breadcrumb "Nuevo"
    @service_object = ServiceObject.new
  end

  # GET /service_objects/1/edit
  def edit
    add_breadcrumb 'Servicios', services_path
    add_breadcrumb @service_object.service_name, service_objects_path
    add_breadcrumb "Editar #{@service_object.name}"
  end

  # POST /service_objects or /service_objects.json
  def create
    @service_object = ServiceObject.new(service_object_params)

    respond_to do |format|
      if @service_object.save
        format.html { redirect_to @service_object, notice: "Service object was successfully created." }
        format.json { render :show, status: :created, location: @service_object }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_objects/1 or /service_objects/1.json
  def update
    respond_to do |format|
      if @service_object.update(service_object_params)
        format.html { redirect_to @service_object, notice: "Service object was successfully updated." }
        format.json { render :show, status: :ok, location: @service_object }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_objects/1 or /service_objects/1.json
  def destroy
    @service_object.destroy
    respond_to do |format|
      format.html { redirect_to service_objects_url, notice: "Service object was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_object
      @service_object = ServiceObject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_object_params
      params.require(:service_object).permit(:name, :price,:description, :position, :service_id, images: [])
    end
end
