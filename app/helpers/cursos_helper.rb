module CursosHelper
  def links_profesores(profesores)
    links = []
    profesores.each do |profesor|
      links << link_to(truncate(profesor.nombre_completo, :length => 25), profesor, :title => profesor.nombre_completo)
    end
    links.join(", ").html_safe
  end
end
