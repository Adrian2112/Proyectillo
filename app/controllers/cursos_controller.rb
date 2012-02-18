class CursosController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :mas_resultados

  def index
    
    load_cursos

    respond_to do |format|
      format.html
      format.js
      format.json {render :json => @cursos.map{ |c| {:id => c.id, :nombre => c.nombre} }}
    end
  end
  
  def mas_resultados
    authorize! :read, Curso
    load_cursos
    render :layout => false
  end

  def show
    @curso = Curso.find(params[:id])
  end

  def new
    @campus = Campus.find(params[:campus_id])
    @curso = @campus.cursos.build
  end

  def edit
    @curso = Curso.find(params[:id])
  end

  def create
    @campus = current_usuario.campus
    @curso = @campus.cursos.build(params[:curso])
    
    if @curso.save
      redirect_to(@curso, :notice => 'El curso fue creado!')
    else
      render :action => "new"
    end
  end

  def update
    @curso = Curso.find(params[:id])

    if @curso.update_attributes(params[:curso])
      redirect_to(@curso, :notice => 'El curso fue actualizado!')
    else
      render :action => "edit"
    end
  end

  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy
    redirect_to(campus_cursos_url(@curso.campus), :notice => "El curso se elimino")
  end
  
  private
  
  def load_cursos    
    @campus = Campus.find(params[:campus_id])

    valores = params[:q].present? ? params[:q].split.map{ |v| "%#{v}%" } : []
    @cursos = @campus.cursos
    query = "cursos.nombre LIKE ?"
    
    valores.each do |v|
      @cursos = @cursos.where(query, v)
    end
    
    @cursos = @cursos.page(params[:page]).per(10)
  end
  
end
