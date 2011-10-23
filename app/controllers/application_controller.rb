class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :store_requested_url, :clear_requested_url

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
    session[:url] || root_path
  end
  
  def after_sign_up_path_for(resource_or_scope)
    session[:url] || root_path
  end

end
