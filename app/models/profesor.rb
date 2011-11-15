# == Schema Information
#
# Table name: profesores
#
#  id               :integer(4)      not null, primary key
#  nombre           :string(255)
#  apellido_materno :string(255)
#  apellido_paterno :string(255)
#  campus_id        :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#  avatar           :string(255)
#

class Profesor < ActiveRecord::Base
  
  attr_accessible :nombre, :apellido_paterno, :apellido_materno, :avatar, :campus, :add_cursos_tokens
  
  belongs_to :campus
  delegate :universidad, :to => :campus
  
  validates :nombre, :presence => true
  validates :apellido_paterno, :presence => true
  #validate :nombre_completo_unico
  validate :minimo_un_curso
  
  has_many :curso_profesor, :dependent => :destroy
  has_many :calificaciones, :through => :curso_profesor
  has_many :cursos, :through => :curso_profesor
  
  mount_uploader :avatar, AvatarUploader
  
  attr_reader :cursos_tokens
  attr_reader :add_cursos_tokens
  
  def to_s
    self.nombre_completo
  end
  
  def nombre_completo
    "#{self.nombre} #{self.apellido_paterno} #{self.apellido_materno}".titleize
  end
  
  def promedio
    if calificaciones.size <= 0
      '-'
    else
      prom = calificaciones.average(:promedio)
      prom.nan? ? 0.0 : '%.1f' % prom
    end
  end
  
  def add_cursos_tokens=(ids)
    nuevos = Curso.find(ids.split(","))
    self.cursos << nuevos
  end
  
  def minimo_un_curso
    errors.add_to_base "El profesor debe tener al menos un curso asignado" if cursos.size <= 0
  end
  
end
