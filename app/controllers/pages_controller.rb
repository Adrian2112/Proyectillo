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

  def faqs
  end
  
  private
  
  def resultados
    @resultados = []
    @universidad = Universidad.where(:id => params[:universidad_id]).first
    @universidad_data = @universidad.nil? ? "" : [{:id => @universidad.id, :nombre => @universidad.nombre}].to_json
    @campus_url = @universidad ? "/universidades/#{@universidad.id}/campus" : ""
    
    @campus = Campus.where(:id => params[:campus_id]).first
    @campus_data = @campus.nil? ? "" : [{:id => @campus.id, :nombre => @campus.nombre }].to_json
    
    campus = Campus.find(params[:campus_id]) unless params[:campus_id].blank?
    
    if !params[:campus_id].blank? 
      # busca solamente curso
      if !params[:curso_nombre].blank? and params[:profesor_nombre].blank?
        @resultados = campus.cursos.where("nombre LIKE ?", "%#{params[:curso_nombre]}%").scoped(:include => :profesores)
        
      # busca solamente profesor
      elsif !params[:profesor_nombre].blank? and params[:curso_nombre].blank?
        @resultados = campus.profesores.where("nombre LIKE ?", "%#{params[:profesor_nombre]}%")
        @resultados = @resultados.scoped(:include => [:cursos, :calificaciones])
        
      # busca curso y profesor
      else
        @resultados = CursoProfesor.joins(:profesor, { :curso => :campus }).where(
                      "profesores.nombre LIKE ? AND cursos.nombre LIKE ? AND campus.id = ?",
                      "%#{params[:profesor_nombre]}%", "%#{params[:curso_nombre]}%", params[:campus_id])
        @resultados = @resultados.scoped(:include => [:profesor, :curso, :calificaciones])
      end
      
      @resultados = @resultados.page(params[:page]).per(10)

    end
   
    
    
  end

end
