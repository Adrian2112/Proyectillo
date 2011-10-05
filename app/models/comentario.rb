# == Schema Information
#
# Table name: comentarios
#
#  id              :integer(4)      not null, primary key
#  comentario      :text
#  usuario_id      :integer(4)
#  calificacion_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class Comentario < ActiveRecord::Base
  attr_accessible :comentario, :usuario_id, :calificacion_id
  
  belongs_to :usuario
  belongs_to :calificacion
end
