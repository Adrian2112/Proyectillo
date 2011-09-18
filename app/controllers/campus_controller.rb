class CampusController < ApplicationController
  # GET /campus
  # GET /campus.xml
  def index
    @campus = Campus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campus }
    end
  end

  # GET /campus/1
  # GET /campus/1.xml
  def show
    @campu = Campus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campu }
    end
  end

  # GET /campus/new
  # GET /campus/new.xml
  def new
    @campu = Campus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campu }
    end
  end

  # GET /campus/1/edit
  def edit
    @campu = Campus.find(params[:id])
  end

  # POST /campus
  # POST /campus.xml
  def create
    @campu = Campus.new(params[:campu])

    respond_to do |format|
      if @campu.save
        format.html { redirect_to(@campu, :notice => 'Campus was successfully created.') }
        format.xml  { render :xml => @campu, :status => :created, :location => @campu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campus/1
  # PUT /campus/1.xml
  def update
    @campu = Campus.find(params[:id])

    respond_to do |format|
      if @campu.update_attributes(params[:campu])
        format.html { redirect_to(@campu, :notice => 'Campus was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campus/1
  # DELETE /campus/1.xml
  def destroy
    @campu = Campus.find(params[:id])
    @campu.destroy

    respond_to do |format|
      format.html { redirect_to(campus_url) }
      format.xml  { head :ok }
    end
  end
end
