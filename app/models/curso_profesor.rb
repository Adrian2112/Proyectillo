# == Schema Information
#
# Table name: cursos_profesores
#
#  id          :integer(4)      not null, primary key
#  curso_id    :integer(4)
#  profesor_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class CursoProfesor < ActiveRecord::Base
  belongs_to :curso
  belongs_to :profesor
  has_many :calificaciones, :dependent => :destroy, :conditions => "flags_count < 3"
  
  def method_missing(method_sym, *arguments, &block)  
    if method_sym.to_s =~ /^promedio_(.*)$/
      promedio = self.calificaciones.average($1.to_sym)
      promedio.nil? ? 0.0 : '%.1f' % promedio
    else
      super
    end
  end
  
end
