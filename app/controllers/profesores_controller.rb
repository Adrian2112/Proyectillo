class ProfesoresController < ApplicationController
  # GET /profesores
  # GET /profesores.xml
  def index
    @profesores = Profesor.where("nombre LIKE ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
      format.xml  { render :xml => @profesores }
    end
  end

  # GET /profesores/1
  # GET /profesores/1.xml
  def show
    @profesor = Profesor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profesor }
    end
  end

  # GET /profesores/new
  # GET /profesores/new.xml
  def new
    @profesor = Profesor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profesor }
    end
  end

  # GET /profesores/1/edit
  def edit
    @profesor = Profesor.find(params[:id])
  end

  # POST /profesores
  # POST /profesores.xml
  def create
    @profesor = current_usuario.campus.profesores.build(params[:profesor])
    respond_to do |format|
      if @profesor.save
        format.html { redirect_to(@profesor, :notice => 'Profesor was successfully created.') }
        format.xml  { render :xml => @profesor, :status => :created, :location => @profesor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profesor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profesores/1
  # PUT /profesores/1.xml
  def update
    @profesor = Profesor.find(params[:id])

    respond_to do |format|
      if @profesor.update_attributes(params[:profesor])
        format.html { redirect_to(@profesor, :notice => 'Profesor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profesor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profesores/1
  # DELETE /profesores/1.xml
  def destroy
    @profesor = Profesor.find(params[:id])
    @profesor.destroy

    respond_to do |format|
      format.html { redirect_to(profesores_url) }
      format.xml  { head :ok }
    end
  end
end
