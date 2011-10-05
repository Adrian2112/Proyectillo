# == Schema Information
#
# Table name: comentarios
#
#  id              :integer(4)      not null, primary key
#  comentario      :text
#  usuario_id      :integer(4)
#  calificacion_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Comentario.new.valid?
  end
end
