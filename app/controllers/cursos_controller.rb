class CursosController < ApplicationController
  load_and_authorize_resource
  
  # GET /cursos
  # GET /cursos.xml
  def index
    @campus = Campus.find(params[:campus_id])
    @cursos = @campus.cursos.where("nombre LIKE ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.xml  { render :xml => @cursos }
    end
  end

  # GET /cursos/1
  # GET /cursos/1.xml
  def show
    @curso = Curso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @curso }
    end
  end

  # GET /cursos/new
  # GET /cursos/new.xml
  def new
    @campus = Campus.find(params[:campus_id])
    @curso = @campus.cursos.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @curso }
    end
  end

  # GET /cursos/1/edit
  def edit
    @curso = Curso.find(params[:id])
  end

  # POST /cursos
  # POST /cursos.xml
  def create
    @campus = Campus.find(params[:campus_id])
    @curso = @campus.cursos.build(params[:curso])

    respond_to do |format|
      if @curso.save
        format.html { redirect_to(@curso, :notice => 'Curso was successfully created.') }
        format.xml  { render :xml => @curso, :status => :created, :location => @curso }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cursos/1
  # PUT /cursos/1.xml
  def update
    @curso = Curso.find(params[:id])

    respond_to do |format|
      if @curso.update_attributes(params[:curso])
        format.html { redirect_to(@curso, :notice => 'Curso was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.xml
  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy

    respond_to do |format|
      format.html { redirect_to(campus_cursos_url(@curso.campus)) }
      format.xml  { head :ok }
    end
  end
end
