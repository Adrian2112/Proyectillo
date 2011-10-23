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
  has_many :calificaciones, :dependent => :destroy
  
  
  def promedio_puntualidad
    prom = calificaciones.map{|califa| califa.puntualidad}.inject(:+).to_f / calificaciones.size
    prom.nan? ? 0.0 : '%.1f' % prom
  end
  
  def promedio_amigable
    prom = calificaciones.map{|califa| califa.amigable}.inject(:+).to_f / calificaciones.size
     prom.nan? ? 0.0 : '%.1f' % prom
  end
  
  def promedio_conocimiento
    prom = calificaciones.map{|califa| califa.conocimiento}.inject(:+).to_f / calificaciones.size
    prom.nan? ? 0.0 : '%.1f' % prom
  end
  
  def promedio_claridad
    prom = calificaciones.map{|califa| califa.claridad}.inject(:+).to_f / calificaciones.size
    prom.nan? ? 0.0 : '%.1f' % prom
  end
  
  def promedio_flexibilidad
    prom = calificaciones.map{|califa| califa.flexibilidad}.inject(:+).to_f / calificaciones.size
    prom.nan? ? 0.0 : '%.1f' % prom
  end
  
  def promedio_facilidad
    prom = calificaciones.map{|califa| califa.facilidad}.inject(:+).to_f / calificaciones.size
    prom.nan? ? 0.0 : '%.1f' % prom
  end
  
  def promedio_general
    prom = calificaciones.map{|califa| califa.promedio}.inject(:+).to_f / calificaciones.size
    prom.nan? ? 0.0 : '%.1f' % prom
  end
  
end
