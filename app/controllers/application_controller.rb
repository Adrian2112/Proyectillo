class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :store_requested_url, :clear_requested_url, :production?

  rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => "Acceso denegado"
  end

  def current_user
    current_usuario
  end

  def store_requested_url
    session[:url] = request.url
  end
  
  def clear_requested_url
    session[:url] = nil
  end
  
  def after_sign_in_path_for(resource_or_scope)
    flash[:notice] ="Bienvenido de nuevo #{current_usuario.username}"
    session[:url] || root_path
  end
  
  def after_sign_up_path_for(resource_or_scope)
    session[:url] || root_path
  end
  
  def production?
      @is_production ||= (ENV['RAILS_ENV'] == 'production')
  end

end
