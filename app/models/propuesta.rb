class Propuesta < ActiveRecord::Base
  acts_as_voteable
  belongs_to :usuario
  belongs_to :campus
  
  attr_accessible :titulo, :descripcion, :categoria, :votos, :usuario_id
  
  validates :titulo, :descripcion, :categoria, presence: true
  
  def votos
    Vote.find_all_by_voteable_id(id).size
  end
  
end
