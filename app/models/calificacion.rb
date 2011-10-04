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
#  profesor_id           :integer(4)
#  facilidad             :integer(4)
#  calificacion_obtenida :float
#  created_at            :datetime
#  updated_at            :datetime
#

class Calificacion < ActiveRecord::Base
  belongs_to :profesor
end
