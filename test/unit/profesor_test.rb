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

require 'test_helper'

class ProfesorTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
