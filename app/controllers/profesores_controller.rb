class ProfesoresController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :mas_resultados

  def index
    load_profesores
    
    respond_to do |format|
      format.html
      format.js   
    end
  end
  
  def mas_resultados
    authorize! :read, Profesor
    load_profesores
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
  
  private
  
  def load_profesores
    @profesores = Profesor.where("nombre LIKE ?", "%#{params[:profesor_q]}%").page(params[:page]).per(10) 
    @profesores = @profesores.scoped(:include => [:cursos, { :campus => :universidad }])   
  end
  
end
