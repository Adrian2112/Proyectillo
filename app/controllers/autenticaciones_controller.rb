class AutenticacionesController < ApplicationController
  def index
    @autenticaciones = Autenticacion.all
  end

  def create
    auth = request.env["omniauth.auth"]
    current_usuario.autenticaciones.create(:provedor => auth['provider'], :uid => auth['uid'])
    flash[:notice] = "Autenticacion hecha."
    redirect_to autenticaciones_url
  end

  def destroy
    @autenticacion = Autenticacion.find(params[:id])
    @autenticacion.destroy
    redirect_to autenticaciones_url, :notice => "Successfully destroyed autenticacion."
  end
end
