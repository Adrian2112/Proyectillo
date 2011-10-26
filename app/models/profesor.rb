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
  
  attr_accessible :nombre, :apellido_paterno, :apellido_materno, :avatar, :campus, :cursos_tokens
  
  belongs_to :campus
  delegate :universidad, :to => :campus
  
  validates :nombre, :presence => true
  validates :apellido_paterno, :presence => true
  validates :apellido_materno, :presence => true
  
  has_many :curso_profesor, :dependent => :destroy
  has_many :calificaciones, :conditions => "flags_count < 0", :through => :curso_profesor
  has_many :cursos, :through => :curso_profesor
  
  mount_uploader :avatar, AvatarUploader
  
  attr_reader :cursos_tokens
  
  def promedio
    if calificaciones.size <= 0
      0.0
    else
      prom = calificaciones.map{|califa| califa.promedio}.inject(:+) / calificaciones.size
      prom.nan? ? 0.0 : '%.1f' % prom
    end
  end
  
  def cursos_tokens=(ids)
    self.curso_ids = ids.split(",")
  end
  
  def nombre_completo
    "#{self.nombre.capitalize} #{self.apellido_paterno.capitalize} #{self.apellido_materno}"
  end
  
  
  
end
