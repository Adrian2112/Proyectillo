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

class Curso < ActiveRecord::Base
  belongs_to :campus
  delegate :universidad, :to => :campus
  
  has_many :curso_profesor, :dependent => :destroy
  has_many :profesores, :through => :curso_profesor
  
  # nombres iguales no permitidos en mismo campus
  validates :nombre, :uniqueness => {:scope => :campus_id}
  validates :campus_id, :nombre, :presence => true
  
  def to_s
    nombre
  end
end
