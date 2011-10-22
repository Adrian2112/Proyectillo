class CampusController < ApplicationController
  load_and_authorize_resource
  
  # GET /campus
  # GET /campus.xml
  def index
    @universidad = Universidad.find(params[:universidad_id])
    @campus = @universidad.campus.where("nombre LIKE ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @universidad.campus.map(&:attributes) }
      format.xml  { render :xml => @campus }
    end
  end
  
  def campus_for_university
    @universidad = Universidad.find(params[:id])
    respond_to do |format|
      format.json { render :json => @universidad.campus.map(&:attributes) }
    end
  end

  # GET /campus/1
  # GET /campus/1.xml
  def show
    @campus = Campus.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campus }
    end
  end

  # GET /campus/new
  # GET /campus/new.xml
  def new
    @universidad = Universidad.find(params[:universidad_id])
    @campus = @universidad.campus.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campus }
    end
  end

  # GET /campus/1/edit
  def edit
    @campus = Campus.find(params[:id])
  end

  # POST /campus
  # POST /campus.xml
  def create
    @universidad = Universidad.find(params[:universidad_id])
    @campus = @universidad.campus.build(params[:campus])

    respond_to do |format|
      if @campus.save
        format.html { redirect_to(@campus, :notice => 'Campus was successfully created.') }
        format.xml  { render :xml => @campus, :status => :created, :location => @campus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campus/1
  # PUT /campus/1.xml
  def update
    @campus = Campus.find(params[:id])

    respond_to do |format|
      if @campus.update_attributes(params[:campus])
        format.html { redirect_to(@campus, :notice => 'Campus was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campus/1
  # DELETE /campus/1.xml
  def destroy
    @campus = Campus.find(params[:id])
    @campus.destroy

    respond_to do |format|
      format.html { redirect_to(universidad_campus_index_url(@campus.universidad)) }
      format.xml  { head :ok }
    end
  end
end
