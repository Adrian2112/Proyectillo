class CalificacionesController < ApplicationController


  load_and_authorize_resource

  def index
    @calificaciones = Calificacion.all
  end

  def show
    @calificacion = Calificacion.find(params[:id])
  end

  def new
    @calificacion = Calificacion.new
  end

  def edit
    @calificacion = Calificacion.find(params[:id])
  end

  def create
    @calificacion = Calificacion.new(params[:calificacion])
    @calificacion.usuario_id = current_usuario.id
    if @calificacion.save
      redirect_to(:back, :notice => 'Calificacion was successfully created.')
    else
      render :action => "new" 
    end
  end

  def update
    @calificacion = Calificacion.find(params[:id])

      if @calificacion.update_attributes(params[:calificacion])
        redirect_to(@calificacion, :notice => 'Calificacion was successfully updated.')
      else
        render :action => "edit" 
      end
  end

  def destroy
    @calificacion = Calificacion.find(params[:id])
    @calificacion.destroy
    redirect_to(calificaciones_url)
  end


  def like
    @calificacion = Calificacion.find(params[:id])
    @like = current_usuario.likes.where(:calificacion_id => @calificacion.id).first
    if @like.nil? 
       current_usuario.likes.build(:calificacion_id => @calificacion.id).save
    else
      @like.destroy
    end
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end
  
end
