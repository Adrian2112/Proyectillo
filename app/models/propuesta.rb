class Propuesta < ActiveRecord::Base
  acts_as_voteable
  belongs_to :usuario
  belongs_to :campus
  has_many :votes, :as => :voteable
  has_many :propuestas_tags, :class_name =>"PropuestaTag", :dependent => :destroy
  has_many :tags, :through => :propuestas_tags
  
  accepts_nested_attributes_for :tags
  
  attr_accessible :titulo, :descripcion, :categoria, :votos, :usuario_id, :tags_tokens
  
  validates :titulo, :descripcion, presence: true
  
  def tags_tokends
    self.tags.map(&:nombre).split(',')
  end
  
  def tags_tokens=(ids)
    ids = ids.split(",")
    ids.delete_if {|i| i.include?("new")}
    self.tag_ids = ids
  end
  
  alias_method :votos, :votes_count
  
end
