class PropuestasController < ApplicationController
  # GET /propuestas
  # GET /propuestas.xml
  def index
    @campus = Campus.find(params[:campus_id])
    @propuestas = @campus.propuestas.order(params[:orden]).page(params[:page]).per(10)
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @propuestas }
      format.js
    end
  end

  # GET /propuestas/1
  # GET /propuestas/1.xml
  def show
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @propuesta }
    end
  end

  # GET /propuestas/new
  # GET /propuestas/new.xml
  def new
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @propuesta }
    end
  end

  # GET /propuestas/1/edit
  def edit
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.find(params[:id])
  end

  # POST /propuestas
  # POST /propuestas.xml
  def create
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.build(params[:propuesta])
    @propuesta.usuario_id = current_usuario.id    #TODO verificar que usuarios no loggeados

    respond_to do |format|
      if @propuesta.save
        format.html { redirect_to(campus_propuesta_path(@campus, @propuesta), :notice => 'Propuesta was successfully created.') }
        format.xml  { render :xml => @propuesta, :status => :created, :location => @propuesta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @propuesta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /propuestas/1
  # PUT /propuestas/1.xml
  def update
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.build(params[:propuesta])

    respond_to do |format|
      if @propuesta.update_attributes(params[:propuesta])
        format.html { redirect_to(campus_propuesta_path(@campus, @propuesta), :notice => 'Propuesta was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @propuesta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /propuestas/1
  # DELETE /propuestas/1.xml
  def destroy
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.find(params[:id])
    @propuesta.destroy

    respond_to do |format|
      format.html { redirect_to campus_propuestas_path(@campus) }
      format.xml  { head :ok }
    end
  end
  
  def vote_up
    begin
      #TODO verificar si usuario no esta loggeado
      @campus = Campus.find(params[:campus_id])
      current_usuario.vote_for(@propuesta = Propuesta.find(params[:id]))
      #redirect_to campus_propuesta_path(@campus, @propuesta)
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
end
