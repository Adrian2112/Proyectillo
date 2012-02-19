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
                     
  extend FriendlyId
  friendly_id :nombre, use: :slugged
  
  def to_s
    nombre
  end
  
  def nombres
    string = ""
    self.campus.each do |campus|
      string = string + "," + campus.nombre
    end
    string
  end
end
