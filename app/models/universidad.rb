# == Schema Information
#
# Table name: universidades
#
#  id         :integer(4)      not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Universidad < ActiveRecord::Base

  has_many :campus, :dependent => :destroy
  has_many :usuarios
  has_many :profesores, :through => :campus
  has_many :abreviaciones

  validates :nombre, :uniqueness => true, 
                     :presence => true
  
  #attr_reader :abreviaciones_tokens
  attr_accessible :nombre, :abreviaciones_tokens
  
  def to_s
    nombre
  end
  
  def nombres
    self.campus.map(&:nombre).join(",")
  end
  
  def abreviaciones_tokens
    self.abreviaciones.map(&:nombre).join(",")
  end
  
  def abreviaciones_tokens=(tags)
    tags = tags.split(",")
    abreviaciones = self.abreviaciones
    abreviaciones.each do |abreviacion|
      unless tags.include?(abreviacion.nombre)
        abreviacion.destroy
      end
    end
    tags.each {|tag| self.abreviaciones.find_or_create_by_nombre(tag)}
  end
  
  def abreviacion_nombres
    self.abreviaciones.map(&:nombre)
  end
end
