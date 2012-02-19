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

  validates :nombre, :uniqueness => true, 
                     :presence => true
  
  def to_s
    nombre
  end
  
  def nombres
    self.campus.map(&:nombre).join(",")
  end
end
