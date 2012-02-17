# == Schema Information
#
# Table name: autenticaciones
#
#  id         :integer(4)      not null, primary key
#  usuario_id :integer(4)
#  provedor   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AutenticacionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Autenticacion.new.valid?
  end
end
