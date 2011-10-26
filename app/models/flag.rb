class Flag < ActiveRecord::Base
  
  belongs_to :usuario
  belongs_to :calificacion, :counter_cache => true
  
end
