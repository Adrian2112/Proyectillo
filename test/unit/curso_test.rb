# == Schema Information
#
# Table name: cursos
#
#  id         :integer(4)      not null, primary key
#  nombre     :string(255)
#  campus_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CursoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
