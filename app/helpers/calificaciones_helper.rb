module CalificacionesHelper
  
  def display_like_link(calificacion)
    if current_usuario.likes.where(:calificacion_id => calificacion.id).first
      link_to "Unlike", like_calificacion_path(calificacion), :remote => true, :method => :post, :id => "like_link_#{calificacion.id}"
    else
			link_to "Like", like_calificacion_path(calificacion), :remote => true, :method => :post, :id => "like_link_#{calificacion.id}"
		end 
  end
  
  def display_flag_link(calificacion)
    if current_usuario.flags.where(:calificacion_id => calificacion.id).first
			link_to "Unflag", flag_calificacion_path(calificacion), :remote => true, :method => :post, :id => "flag_link_#{calificacion.id}"
		else
			link_to "Flag", flag_calificacion_path(calificacion), :remote => true, :method => :post, :id => "flag_link_#{calificacion.id}"
		end
  end
  
end
