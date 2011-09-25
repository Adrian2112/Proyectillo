class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.authenticate(params[:login], params[:password])
    if usuario
      session[:usuario_id] = usuario.id
      flash[:notice] = "Logged in successfully."
      redirect_to_target_or_default("/")
    else
      flash.now[:error] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:usuario_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to "/"
  end
end
