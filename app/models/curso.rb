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
  has_and_belongs_to_many :profesores
end
