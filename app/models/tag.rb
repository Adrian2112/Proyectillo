class Tag < ActiveRecord::Base
  has_many :propuestas_tags, :class_name =>"PropuestaTag", :dependent => :destroy
  has_many :propuestas, :through => :propuestas_tags
end
