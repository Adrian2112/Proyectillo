class Profesor < ActiveRecord::Base
  has_one :campus
  has_many :calificaciones
  has_and_belongs_to_many :cursos
end
