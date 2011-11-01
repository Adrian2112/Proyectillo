module ProfesoresHelper
  
  def links_cursos(cursos)
    links = []
    cursos.each do |curso|
      links << link_to(truncate(curso.nombre, :length => 25), curso, :title => curso.nombre)
    end
    links.join(", ").html_safe
  end
end
