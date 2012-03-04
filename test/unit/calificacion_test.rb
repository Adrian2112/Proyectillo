# == Schema Information
#
# Table name: calificaciones
#
#  id                    :integer(4)      not null, primary key
#  puntualidad           :float           default(0.0)
#  amigable              :float           default(0.0)
#  conocimiento          :float           default(0.0)
#  claridad              :float           default(0.0)
#  flexibilidad          :float           default(0.0)
#  promedio              :float
#  critica               :text
#  facilidad             :float           default(0.0)
#  calificacion_obtenida :float
#  usuario_id            :integer(4)
#  curso_profesor_id     :integer(4)
#  likes_count           :integer(4)      default(0)
#  flags_count           :integer(4)      default(0)
#  created_at            :datetime
#  updated_at            :datetime
#

require 'test_helper'

class CalificacionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
