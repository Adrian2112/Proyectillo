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
  
  has_many :curso_profesor, :dependent => :destroy
  has_many :profesores, :through => :curso_profesor
end
