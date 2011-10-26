class ComentariosController < ApplicationController
  load_and_authorize_resource
  
  def index
    @comentarios = Comentario.all
  end

  def show
    @comentario = Comentario.find(params[:id])
  end

  def new
    @comentario = Comentario.new
  end

  def create
    @comentario = Comentario.new(params[:comentario])
    @comentario.usuario_id = current_usuario.id
    if @comentario.save
      flash[:notice] = "Successfully created comentario."
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      render :action => 'new'
    end

  end

  def edit
    @comentario = Comentario.find(params[:id])
  end

  def update
    @comentario = Comentario.find(params[:id])
    if @comentario.update_attributes(params[:comentario])
      flash[:notice] = "Successfully updated comentario."
      redirect_to @comentario
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy
    flash[:notice] = "Successfully destroyed comentario."
    redirect_to comentarios_url
  end
end
