class UniversidadesController < ApplicationController

  def index
    @universidades = Universidad.page(params[:page]).per(10).where("nombre LIKE ?", "%#{params[:universidad_q]}%")

    respond_to do |format|
      format.html
      format.js 
      format.json { render :json => @universidades.map(&:attributes) }
    end
  end

  def mas_universidades
    @universidades = Universidad.where("nombre LIKE ?", "%#{params[:q]}%").page(params[:page]).per(10)
    render :layout => false
  end

  def show
    @universidad = Universidad.find(params[:id])
  end

  def new
    @universidad = Universidad.new
  end

  def edit
    @universidad = Universidad.find(params[:id])
  end

  def create
    @universidad = Universidad.new(params[:universidad])

    if @universidad.save
      redirect_to(@universidad, :notice => 'Universidad was successfully created.') 
    else
      render :action => "new"
    end
  end

  def update
    @universidad = Universidad.find(params[:id])

    if @universidad.update_attributes(params[:universidad])
      redirect_to(@universidad, :notice => 'Universidad was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @universidad = Universidad.find(params[:id])
    @universidad.destroy
    redirect_to(universidades_url)
  end
  
end
