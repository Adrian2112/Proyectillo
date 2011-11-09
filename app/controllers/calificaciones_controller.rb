class CalificacionesController < ApplicationController

  load_and_authorize_resource

  def create
    @calificacion = Calificacion.new(params[:calificacion])
    @calificacion.usuario_id = current_usuario.id
    @curso_profesor = @calificacion.curso_profesor
    
    if @calificacion.save
      respond_to do |format|
        format.html {
          redirect_to(:back, :notice => 'Tu calificacion ha sido asignada')
        }
        format.js
      end
    else
      respond_to do |format|
        format.html {
          render :action => "new" 
        }
        format.js
      end
    end
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
  
  def flag
    @calificacion = Calificacion.find(params[:id])
    @flag = current_usuario.flags.where(:calificacion_id => @calificacion.id).first
    if @flag.nil? 
       current_usuario.flags.build(:calificacion_id => @calificacion.id).save
    else
      @flag.destroy
    end
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end
  
end
