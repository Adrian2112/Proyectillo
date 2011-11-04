class ComentariosController < ApplicationController
  load_and_authorize_resource
  
  def create
    @comentario = Comentario.new(params[:comentario])
    @comentario.usuario_id = current_usuario.id
    if @comentario.save
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      render :action => 'new'
    end

  end

end
