class CursosProfesoresController < ApplicationController
  
  def curso_profesor
    @profesor = Profesor.find(params[:profesor_id])
    @curso_profesor = @profesor.curso_profesor.find_by_curso_id(params[:curso_id],
                      :include => { :calificaciones => [ {:comentarios => :usuario}, :likes, :usuario]})
    respond_to do |format|
      format.html
      format.js
    end
  end

end
