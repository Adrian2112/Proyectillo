class Like < ActiveRecord::Base
  
  belongs_to :calificacion, :counter_cache => true
  belongs_to :usuario
  
end
