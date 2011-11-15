class CampusController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :mas_resultados

  def index
    load_campus

    respond_to do |format|
      format.html
      format.json { render :json => @campus.map(&:attributes) }
      format.js
    end
  end
  
  def mas_resultados
    authorize! :read, Campus
    load_campus
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
  
  def load_campus
    @universidad = Universidad.find(params[:universidad_id])
    @campus = @universidad.campus.where("nombre LIKE ?", "%#{params[:q]}%").page(params[:page]).per(10) 
    @campus = @campus.scoped(:include => [:cursos, :profesores])
  end
  
end
