module CursoProfesorHelper
  
  def display_like_link(calificacion)
    if current_usuario
      if current_usuario.already_liked?(calificacion.id)
        link calificacion, :class => "unlike", :title => "No me gusta", :url => like_calificacion_path(calificacion)
      else
        link calificacion, :class => "like", :title => "Me gusta", :url => like_calificacion_path(calificacion)
      end
    else
  		  content_tag(:p, "", :class => "like")
    end
  end
  
  def display_flag_link(calificacion)
    if current_usuario
      if current_usuario.already_flagged?(calificacion.id)
        link calificacion, :class => "unflag", :title => "Marcar como inapropiado", :url => flag_calificacion_path(calificacion)
      else
        link calificacion, :class => "flag", :title => "Desmarcar como inapropiado", :url => flag_calificacion_path(calificacion)
      end
    else
      content_tag(:p, "", :class => "flag")
    end
  end
  
  def link(calificacion, params={})
     link_to "", params[:url], 
  		            :remote => true, :method => :post, 
  		            :id => "flag_link_#{calificacion.id}", :class => "#{params[:class]} tooltip", :title => "#{params[:title]}"
  end
  
end
