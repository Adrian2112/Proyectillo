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
  
  attr_accessible :nombre, :apellido_paterno, :apellido_materno, :avatar, :cursos_tokens, :cursos_attributes
  
  belongs_to :campus
  delegate :universidad, :to => :campus
  
  validates :nombre, :apellido_paterno, :campus_id, :presence => true
  validate :minimo_un_curso
  
  has_many :curso_profesor, :dependent => :destroy
  has_many :calificaciones, :through => :curso_profesor
  has_many :cursos, :through => :curso_profesor
  
  mount_uploader :avatar, AvatarUploader
  accepts_nested_attributes_for :cursos
  attr_reader :cursos_tokens
  
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
      prom.nan? ? 0.0 : ('%.1f' % prom).to_f
    end
  end
    
  def minimo_un_curso
    errors.add(:base, "El profesor debe tener al menos un curso asignado") if cursos.size <= 0
  end

  def nombres_cursos
    self.cursos.map(&:nombre).join(",")
  end

  def cursos_tokens=(ids)
    ids = ids.split(",")
    ids.delete_if{ |i| i.include?("new") }
    self.curso_ids = ids
  end  
  
end
