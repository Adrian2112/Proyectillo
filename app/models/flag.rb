# == Schema Information
#
# Table name: flags
#
#  id              :integer(4)      not null, primary key
#  usuario_id      :integer(4)
#  calificacion_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class Flag < ActiveRecord::Base
  
  belongs_to :usuario
  belongs_to :calificacion, :counter_cache => true
  
end
