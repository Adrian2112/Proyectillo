# == Schema Information
#
# Table name: likes
#
#  id              :integer(4)      not null, primary key
#  usuario_id      :integer(4)
#  calificacion_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class Like < ActiveRecord::Base
  
  belongs_to :calificacion, :counter_cache => true
  belongs_to :usuario
  
end
