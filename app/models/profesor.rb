class Profesor < ActiveRecord::Base
  has_one :campus
  has_many :calificaciones
  has_and_belongs_to_many :cursos
  has_attached_file :imagen, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
