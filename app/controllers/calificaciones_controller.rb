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

    if @calificacion.save
      redirect_to(@calificacion, :notice => 'Calificacion was successfully created.')
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
  
end
