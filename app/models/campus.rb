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
  has_many :cursos, :dependent => :destroy
  has_many :profesores, :dependent => :destroy
  has_many :usuarios
  has_many :propuestas
  
  extend FriendlyId
  friendly_id :nombre, use: :slugged  #=> In production: Campus.find_each(&:save)

  validates :nombre, :uniqueness => {:scope => :universidad_id},
                     :presence => true

  def to_s
    nombre
  end
  
end
