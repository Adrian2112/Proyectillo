require 'test_helper'

class AutenticacionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Autenticacion.new.valid?
  end
end
