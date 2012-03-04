class PagesController < ApplicationController
  
  def index
    if params[:search].present?
    @search = Sunspot.search Profesor, Universidad, Curso do |query|
      query.fulltext params[:search]
      query.paginate :page => params[:page], :per_page => 10
    end
    @resultados = @search.results
    #resultados
        
    respond_to do |format|
      format.html
      format.js  
    end
  end

  end
  
  def mas_resultados
    if params[:search].present?
    @search = Sunspot.search Profesor, Universidad, Curso do |query|
      query.fulltext params[:search]
      query.paginate :page => params[:page], :per_page => 10
    end
    @resultados = @search.results
    #resultados
        
    respond_to do |format|
      format.js  
    end
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
  
  def share_buttons
    @param = params[:url]
    render :layout => false
  end
  
end
