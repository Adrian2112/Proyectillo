module ProfesoresHelper
  
  def display_calificaciones
    div = ""
    @cursos.each do |curso|
		  curso_profesor = @profesor.curso_profesor.find_by_curso_id(curso.id,
		                  :include => { :calificaciones => [ {:comentarios => :usuario}, :likes, :usuario]})
			div << content_tag(:div, :class => "curso_profesor", :id => "curso_profesor_#{curso.id}_#{@profesor.id}") do
			            render :partial => 'cursos_profesores/calificaciones', :locals => {:curso_profesor => curso_profesor}
		  end
		end
		div.html_safe
  end
  
end
