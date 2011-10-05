# == Schema Information
#
# Table name: cursos_profesores
#
#  id          :integer(4)      not null, primary key
#  curso_id    :integer(4)
#  profesor_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class CursoProfesor < ActiveRecord::Base
  belongs_to :curso
  belongs_to :profesor
  has_many :calificaciones, :dependent => :destroy
end
