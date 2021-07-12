class ApplicationController < ActionController::Base

  before_action :set_locale
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token
  # before_action :masquerade_user!

  
  def set_locale
    if user_signed_in?
      I18n.locale = current_user.language
    else
      I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
    end
  end
  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE','').scan(/[a-z]{2}/).first
  end

  protected
   
  def configure_permitted_parameters
    # devise invitable conf
    added_attrs = [:email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:email]
    # end devise invitable conf

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :address, :province, :cod_postal, :phone, :language])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:last_name, :address, :province, :cod_postal, :phone, :dni, :avatar, :language])
  end
end
