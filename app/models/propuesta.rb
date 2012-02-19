class Propuesta < ActiveRecord::Base
  acts_as_voteable
  belongs_to :usuario
  belongs_to :campus
  has_many :votes, :as => :voteable
  
  attr_accessible :titulo, :descripcion, :categoria, :votos, :usuario_id
  
  validates :titulo, :descripcion, :categoria, presence: true
  
  alias_method :votos, :votes_count
  
end
