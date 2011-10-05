# == Schema Information
#
# Table name: profesores
#
#  id                  :integer(4)      not null, primary key
#  nombre              :string(255)
#  apellido_materno    :string(255)
#  apellido_paterno    :string(255)
#  campus_id           :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  imagen_file_name    :string(255)
#  imagen_content_type :string(255)
#  imagen_file_size    :integer(4)
#  imagen_updated_at   :datetime
#

class Profesor < ActiveRecord::Base

  has_attached_file :imagen, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  belongs_to :campus
  
  has_many :curso_profesor, :dependent => :destroy
  has_many :calificaciones, :through => :curso_profesor
  has_many :cursos, :through => :curso_profesor

end
