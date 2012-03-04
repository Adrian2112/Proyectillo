class Tag < ActiveRecord::Base
  has_many :propuestas_tags, :class_name =>"PropuestaTag", :dependent => :destroy
  has_many :propuestas, :through => :propuestas_tags
  
  validates :nombre, :uniqueness => true
  
  def to_s
    self.nombre
  end
end
