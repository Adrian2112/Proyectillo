# == Schema Information
#
# Table name: campus
#
#  id             :integer(4)      not null, primary key
#  nombre         :string(255)
#  ciudad         :string(255)
#  estado         :string(255)
#  universidad_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

class Campus < ActiveRecord::Base
  belongs_to :universidad
  has_many :cursos
  has_many :profesores
end
