class CalificacionesController < ApplicationController
  # GET /calificaciones
  # GET /calificaciones.xml
  def index
    @calificaciones = Calificacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calificaciones }
    end
  end

  # GET /calificaciones/1
  # GET /calificaciones/1.xml
  def show
    @calificacion = Calificacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calificacion }
    end
  end

  # GET /calificaciones/new
  # GET /calificaciones/new.xml
  def new
    @calificacion = Calificacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calificacion }
    end
  end

  # GET /calificaciones/1/edit
  def edit
    @calificacion = Calificacion.find(params[:id])
  end

  # POST /calificaciones
  # POST /calificaciones.xml
  def create
    @calificacion = Calificacion.new(params[:calificacion])

    respond_to do |format|
      if @calificacion.save
        format.html { redirect_to(@calificacion, :notice => 'Calificacion was successfully created.') }
        format.xml  { render :xml => @calificacion, :status => :created, :location => @calificacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calificacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calificaciones/1
  # PUT /calificaciones/1.xml
  def update
    @calificacion = Calificacion.find(params[:id])

    respond_to do |format|
      if @calificacion.update_attributes(params[:calificacion])
        format.html { redirect_to(@calificacion, :notice => 'Calificacion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calificacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calificaciones/1
  # DELETE /calificaciones/1.xml
  def destroy
    @calificacion = Calificacion.find(params[:id])
    @calificacion.destroy

    respond_to do |format|
      format.html { redirect_to(calificaciones_url) }
      format.xml  { head :ok }
    end
  end
end
