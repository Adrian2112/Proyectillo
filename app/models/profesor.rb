class Profesor < ActiveRecord::Base
  has_attached_file :imagen, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
end
