class PagesController < ApplicationController
  
  def index
    universidad_id = params[:universidad_id]
    campus_id = params[:campus_id]

    @resultados = Array.new
    if universidad_id != nil
      @resultados = Universidad.find(universidad_id)
    elsif universidad_id != nil and campus_id != nil
      @resultados = Campus.find(campus_id)
    elsif universidad_id != nil and campus_id != nil and params[:nombre_curso].present?
      campus = Campus.find(params[:campus_id])      
      @resultados = campus.cursos.where("nombre LIKE ?", "%#{params[:nombre_curso]}%")
      respond_to do |format|
        format.html
        format.js  
      end
    else
      @resultados
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

end
