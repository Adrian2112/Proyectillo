module CursoProfesorHelper
  
  def display_like_link(calificacion)
    if current_usuario.likes.where(:calificacion_id => calificacion.id).first
      link_to "", like_calificacion_path(calificacion), 
                  :remote => true, :method => :post, 
                  :id => "like_link_#{calificacion.id}", :class => "unlike", :title => "No me gusta"
    else
			link_to "", like_calificacion_path(calificacion), 
			            :remote => true, :method => :post, 
			            :id => "like_link_#{calificacion.id}", :class => "like", :title => "Me gusta"
		end 
  end
  
  def display_flag_link(calificacion)
    if current_usuario.flags.where(:calificacion_id => calificacion.id).first
			link_to "", flag_calificacion_path(calificacion), :remote => true, :method => :post, :id => "flag_link_#{calificacion.id}", :class => "unflag"
		else
			link_to "", flag_calificacion_path(calificacion), :remote => true, :method => :post, :id => "flag_link_#{calificacion.id}", :class => "flag"
		end
  end
  
end
