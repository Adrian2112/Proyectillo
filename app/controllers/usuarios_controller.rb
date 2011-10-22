class UsuariosController < ApplicationController
  load_and_authorize_resource
  
  before_filter :login_required, :except => [:new, :create]

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      session[:usuario_id] = @usuario.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to "/"
    else
      render :action => 'new'
    end
  end

  def edit
    @usuario = current_usuario
  end

  def update
    @usuario = current_usuario
    if @usuario.update_attributes(params[:usuario])
      flash[:notice] = "Your profile has been updated."
      redirect_to "/"
    else
      render :action => 'edit'
    end
  end
end
