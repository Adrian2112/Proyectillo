# == Schema Information
#
# Table name: cursos_profesores
#
#  curso_id    :integer(4)
#  profesor_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class CursoProfesor < ActiveRecord::Base
  belongs_to :curso
  belongs_to :profesor
end
