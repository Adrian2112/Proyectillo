class CursosProfesoresController < ApplicationController
  # GET /cursos_profesores
  # GET /cursos_profesores.xml
  def index
    @cursos_profesores = CursoProfesor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cursos_profesores }
    end
  end

  # GET /cursos_profesores/1
  # GET /cursos_profesores/1.xml
  def show
    @curso_profesor = CursoProfesor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @curso_profesor }
    end
  end

  # GET /cursos_profesores/new
  # GET /cursos_profesores/new.xml
  def new
    @curso_profesor = CursoProfesor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @curso_profesor }
    end
  end

  # GET /cursos_profesores/1/edit
  def edit
    @curso_profesor = CursoProfesor.find(params[:id])
  end

  # POST /cursos_profesores
  # POST /cursos_profesores.xml
  def create
    @curso_profesor = CursoProfesor.new(params[:curso_profesor])

    respond_to do |format|
      if @curso_profesor.save
        format.html { redirect_to(@curso_profesor, :notice => 'Curso profesor was successfully created.') }
        format.xml  { render :xml => @curso_profesor, :status => :created, :location => @curso_profesor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curso_profesor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cursos_profesores/1
  # PUT /cursos_profesores/1.xml
  def update
    @curso_profesor = CursoProfesor.find(params[:id])

    respond_to do |format|
      if @curso_profesor.update_attributes(params[:curso_profesor])
        format.html { redirect_to(@curso_profesor, :notice => 'Curso profesor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curso_profesor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos_profesores/1
  # DELETE /cursos_profesores/1.xml
  def destroy
    @curso_profesor = CursoProfesor.find(params[:id])
    @curso_profesor.destroy

    respond_to do |format|
      format.html { redirect_to(cursos_profesores_url) }
      format.xml  { head :ok }
    end
  end
end
