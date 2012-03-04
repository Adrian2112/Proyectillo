# == Schema Information
#
# Table name: flags
#
#  id              :integer(4)      not null, primary key
#  usuario_id      :integer(4)
#  calificacion_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class FlagTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
