class RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:omniauth] = nil unless @usuario.new_record?
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @usuario.apply_omniauth(session[:omniauth])
      @usuario.valid?
    end
  end
end


