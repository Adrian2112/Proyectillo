class Like < ActiveRecord::Base
  
  belongs_to :calificacion
  belongs_to :usuario
  
end
