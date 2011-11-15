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
    @curso_profesor = @profesor.curso_profesor.find_by_curso_id(@cursos.first.try(:id),
                      :include => { :calificaciones => [ {:comentarios => :usuario}, :likes, :usuario]})
  end

  def new
    @profesor = Profesor.new
  end

  def edit
    @profesor = Profesor.find(params[:id])
  end

  def create
    @profesor = current_usuario.campus.profesores.build(params[:profesor])

    if @profesor.save
      redirect_to(@profesor, :notice => 'El profesor se dio de alta correctamente') 
    else
       render :action => "new" 
    end
  end

  def update
    @profesor = Profesor.find(params[:id])

    if @profesor.update_attributes(params[:profesor])
      redirect_to(@profesor, :notice => 'El profesor se actualizo correctamente')
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
    @profesores = Profesor.where("nombre LIKE :profesor OR 
                                  apellido_materno LIKE :profesor OR 
                                  apellido_paterno LIKE :profesor", 
                                  {:profesor => "%#{params[:profesor_q]}%"} ).page(params[:page]).per(10) 
    @profesores = @profesores.scoped(:include => [:cursos, { :campus => :universidad }])   
  end
  
end
