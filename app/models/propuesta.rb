class Propuesta < ActiveRecord::Base
  acts_as_voteable
  belongs_to :usuario
  belongs_to :campus
  has_many :votes, :as => :voteable
  has_many :propuestas_tags, :class_name =>"PropuestaTag", :dependent => :destroy
  has_many :tags, :through => :propuestas_tags
  
  attr_accessible :titulo, :descripcion, :categoria, :votos, :usuario_id
  
  validates :titulo, :descripcion, presence: true
  
  alias_method :votos, :votes_count
  
end
