class CursosController < ApplicationController
  load_and_authorize_resource
  

  def index
    @campus = Campus.find(params[:campus_id])
    @cursos = @campus.cursos.where("nombre LIKE ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html
      format.js
    end
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
    @campus = Campus.find(params[:campus_id])
    @curso = @campus.cursos.build(params[:curso])
    
    if @curso.save
      redirect_to(@curso, :notice => 'Curso was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @curso = Curso.find(params[:id])

    if @curso.update_attributes(params[:curso])
      redirect_to(@curso, :notice => 'Curso was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy
    redirect_to(campus_cursos_url(@curso.campus), :notice => "El curso se elimino")
  end
end
