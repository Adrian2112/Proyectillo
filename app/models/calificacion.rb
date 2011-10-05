# == Schema Information
#
# Table name: calificaciones
#
#  id                    :integer(4)      not null, primary key
#  puntualidad           :integer(4)
#  amigable              :integer(4)
#  conocimiento          :integer(4)
#  claridad              :integer(4)
#  flexibilidad          :integer(4)
#  promedio              :float
#  comentarios           :string(255)
#  facilidad             :integer(4)
#  calificacion_obtenida :float
#  usuario_id            :integer(4)
#  curso_profesor_id     :integer(4)
#  created_at            :datetime
#  updated_at            :datetime
#

class Calificacion < ActiveRecord::Base  
  has_many :comentarios, :dependent => :destroy
  belongs_to :usuario
  
  belongs_to :curso_profesor
  delegate :profesor, :curso, :to => :curso_profesor
end
