class ServiceItemsController < ApplicationController
  before_action :set_service
  def show
    @service_item = @service.service_items.find(params[:id])
  end
  def create
   @service_item = @service.service_items.create(service_item_params)
   redirect_to @service
  end
  
  def destroy
    @service_item = @service.service_items.find(params[:id])
    if @service_item.destroy
      flash[:success] = "service item was deleted."
    else
      flash[:error] = "service item could not be deleted."
    end
    redirect_to services_path
  end

  private
  def set_service
    @service = Service.find(params[:service_id])
  end
  def service_item_params
    params[:service_item].permit(:name, :body, :price, images: [])
  end
end
