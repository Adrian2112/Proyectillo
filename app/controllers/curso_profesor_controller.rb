class CursoProfesorController < ApplicationController
  
  def curso_profesor
    profesor = Profesor.find(params[:profesor_id])
    @curso_profesor = profesor.curso_profesor.find_by_curso_id(params[:curso_id])
    respond_to do |format|
      format.js
    end
  end

end
