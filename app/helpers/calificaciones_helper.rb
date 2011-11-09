module CalificacionesHelper
  
  def rating_stars(f, atributo)
    radio_buttons = ""
    (1..10).each do |i|
      radio_buttons << f.radio_button(atributo, i, :class => "star {split:2}")
    end
    radio_buttons.html_safe
  end
  
  def display_like_link(calificacion)
    if current_usuario
      if current_usuario.already_liked?(calificacion.id)
        link calificacion, :tipo => "like", :class => "unlike",
                            :title => "Ya no me gusta", :url => like_calificacion_path(calificacion)
      else
        link calificacion, :tipo => "like", :class => "like", 
                            :title => "Me gusta", :url => like_calificacion_path(calificacion)
      end
    else
  		  content_tag(:p, "", :class => "like", :tipo => "like")
    end
  end
  
  def display_flag_link(calificacion)
    if current_usuario
      if current_usuario.already_flagged?(calificacion.id)
        link calificacion, :tipo => 'flag', :class => "unflag",
                            :title => "Marcar como inapropiado", :url => flag_calificacion_path(calificacion)
      else
        link calificacion, :tipo => 'flag', :class => "flag",
                            :title => "Desmarcar como inapropiado", :url => flag_calificacion_path(calificacion)
      end
    else
      content_tag(:p, "", :class => "flag", :tipo => "flag")
    end
  end
  
  def link(calificacion, params={})
     link_to "", params[:url], 
  		            :remote => true, :method => :post, 
  		            :id => "#{params[:tipo]}_link_#{calificacion.id}", :class => "#{params[:class]}", :title => "#{params[:title]}"
  end
  
end
