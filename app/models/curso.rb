class Curso < ActiveRecord::Base
  has_one :campus
  has_many :profesores
  has_and_belongs_to_many :profesores
end
