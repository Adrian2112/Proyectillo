class PagesController < ApplicationController
  
  def index
    
    resultados
        
    respond_to do |format|
      format.html
      format.js  
    end

  end
  
  def mas_resultados
    resultados
    
    respond_to do |format|
      format.js
    end
  end

  def about_us
  end

  def contact
  end

  def terms_of_use
  end

  def privacy
  end

  def legal_advisor
  end
  
  private
  
  def resultados
    @resultados = []    
    campus = Campus.find(params[:campus_id]) if params[:campus_id]
    
    if !params[:campus_id].nil? 
      if !params[:curso_nombre].nil? and params[:profesor_nombre].blank?
        @resultados = campus.cursos.where("nombre LIKE ?", "%#{params[:curso_nombre]}%")
      elsif !params[:profesor_nombre].nil? and params[:curso_nombre].blank?
        @resultados = campus.profesores.where("nombre LIKE ?", "%#{params[:profesor_nombre]}%")
      else
        @resultados = CursoProfesor.joins(:profesor, :curso).where(
                      "profesores.nombre LIKE ? AND cursos.nombre LIKE ?",
                      "%#{params[:profesor_nombre]}%", "%#{params[:curso_nombre]}%")
      end
      
      @resultados = @resultados.page(params[:page]).per(10)
    end    
  end

end
