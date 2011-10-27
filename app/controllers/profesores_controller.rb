class ProfesoresController < ApplicationController
  load_and_authorize_resource

  def index
    @profesores = Profesor.where("nombre LIKE ? OR 
                                  apellido_materno LIKE ? OR 
                                  apellido_paterno LIKE ?", 
                                  "%#{params[:profesor_q]}%","%#{params[:profesor_q]}%", "%#{params[:profesor_q]}%" )

    respond_to do |format|
      format.html
      format.js   
    end
  end

  def show
    @profesor = Profesor.find(params[:id])
    @cursos = @profesor.cursos
  end

  def new
    @profesor = Profesor.new
  end

  def edit
    @profesor = Profesor.find(params[:id])
  end

  def create
    @profesor = current_usuario.campus.profesores.build(params[:profesor])
    #@curso = Curso.find(params[:profesor_curso_id])
    #@profesor.cursos << @curso
    if @profesor.save
      redirect_to(@profesor, :notice => 'Profesor was successfully created.') 
    else
       render :action => "new" 
    end
  end

  def update
    @profesor = Profesor.find(params[:id])

    if @profesor.update_attributes(params[:profesor])
      redirect_to(@profesor, :notice => 'Profesor was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @profesor = Profesor.find(params[:id])
    @profesor.destroy
    redirect_to(profesores_path) 
  end
  
end
