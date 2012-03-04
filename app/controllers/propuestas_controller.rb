class PropuestasController < ApplicationController
  load_and_authorize_resource

  def index
    @campus = Campus.find(params[:campus_id])
    @propuestas = @campus.propuestas.order(params[:orden]).page(params[:page]).per(10)
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @propuestas }
      format.js
    end
  end
  
  def mis_votos
    @campus = Campus.find(params[:campus_id])
    @propuestas = Propuesta.joins(:votes).where("votes.voter_id" => current_usuario).page(params[:page]).per(10)
  
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @propuestas }
      format.js { render 'index.js' }
    end
  end
  
  def mis_propuestas
    @campus = Campus.find(params[:campus_id])
    @propuestas = current_usuario.propuestas.page(params[:page]).per(10)

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @propuestas }
      format.js { render 'index.js' }
    end
  end

  def show
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @propuesta }
    end
  end

  def new
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @propuesta }
    end
  end

  def edit
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.find(params[:id])
  end

  def create
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.build(params[:propuesta])
    @propuesta.usuario_id = current_usuario.id    #TODO verificar que usuarios no loggeados

    nuevos_tags
    
    if @propuesta.save
      redirect_to(campus_propuesta_path(@campus, @propuesta), :notice => 'Propuesta was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.build(params[:propuesta])
    
    nuevos_tags
    
    if @propuesta.update_attributes(params[:propuesta])
      redirect_to(campus_propuesta_path(@campus, @propuesta), :notice => 'Propuesta was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @campus = Campus.find(params[:campus_id])
    @propuesta = @campus.propuestas.find(params[:id])
    @propuesta.destroy

    redirect_to campus_propuestas_path(@campus)
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
  
  private
  
  def nuevos_tags
    @new_tags = @propuesta.tags.reject{ |c| !c.new_record? }
  end
end
