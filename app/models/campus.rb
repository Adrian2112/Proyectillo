class Campus < ActiveRecord::Base
  belongs_to :universidad
  has_many :cursos
  has_many :profesores
end
