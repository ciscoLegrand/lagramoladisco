class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    add_breadcrumb 'Usuarios'
    @headers = current_user.is_superadmin? ? ['NOMBRE', 'APELLIDO','TELEFONO','EMAIL', 'REGISTRO','ROL'] : ['NOMBRE', 'APELLIDO','TELEFONO','EMAIL']
    @attrs = current_user.is_admin? ? [:name,:last_name, :phone, :email, :created_at, :role] : [:name,:last_name,:phone,:email]
    
    result = User.order(params[:sort])
    @pagy, @users = pagy(User.all, items: 10)

  end
end
