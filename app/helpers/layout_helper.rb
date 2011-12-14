# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def pages
    params[:controller] == 'pages'
  end

  def signing
    params[:controller] == 'registrations' or 
    params[:controller] == 'usuarios' or 
    params[:controller] == 'sessions' or
    params[:controller] == 'contact'
  end
  
  def keywords
    string = " "
    if @profesor and !@profesor.new_record?
      string = ",#{@profesor.nombre_completo} #{@profesor.nombres_cursos}, #{@profesor.universidad.nombre}, #{@profesor.campus.nombre}"
    elsif @universidad and @universidad.new_record?
        string = ",#{@universidad.nombre}, #{@universidad.nombres}"
    end

  end

end
