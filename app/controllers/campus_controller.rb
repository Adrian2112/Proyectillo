class CampusController < ApplicationController

  def index
    @universidad = Universidad.find(params[:universidad_id])
    @campus = @universidad.campus.where("nombre LIKE ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html
      format.json { render :json => @universidad.campus.map(&:attributes) }
    end
  end

  def show
    @campus = Campus.find(params[:id])
  end

  def new
    @universidad = Universidad.find(params[:universidad_id])
    @campus = @universidad.campus.build
  end

  def edit
    @campus = Campus.find(params[:id])
  end

  def create
    @universidad = Universidad.find(params[:universidad_id])
    @campus = @universidad.campus.build(params[:campus])

      if @campus.save
        redirect_to(@campus, :notice => 'Campus was successfully created.')
      else
        render :action => "new"
      end
  end

  def update
    @campus = Campus.find(params[:id])

      if @campus.update_attributes(params[:campus])
         redirect_to(@campus, :notice => 'Campus was successfully updated.') 
      else
         render :action => "edit"
      end
  end

  def destroy
    @campus = Campus.find(params[:id])
    @campus.destroy
    redirect_to(universidad_campus_index_url(@campus.universidad))
  end
  
end
