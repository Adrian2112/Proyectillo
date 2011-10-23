class AutenticacionesController < ApplicationController
  def index
    @autenticaciones = current_usuario.autenticaciones if current_usuario
  end

  def create
    omniauth = request.env["omniauth.auth"]
    autenticacion = Autenticacion.find_by_provedor_and_uid(omniauth['provider'], omniauth['uid'])
    # Si el usuario tiene un registro en la tabla de autenticaciones
    if autenticacion
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:usuario, autenticacion.usuario)
    # Si el usuario tiene una sesion iniciada
    elsif current_usuario
      current_usuario.autenticaciones.create!(:provedor => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Autenticacion hecha."
      redirect_to autenticaciones_url
    # Si no hay usuario en sesion y trata de dar login con un provedor
    else
      usuario = Usuario.new
      usuario.apply_omniauth(omniauth)
      if usuario.save
        flash[:notice] = "Iniciada sesion."
        sign_in_and_redirect(:usuario, usuario)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_usuario_registration_url
      end
    end
  end

  def destroy
    @autenticacion = current_usuario.autenticaciones.find(params[:id])
    @autenticacion.destroy
    redirect_to autenticaciones_url, :notice => "Successfully destroyed autenticacion."
  end
end
