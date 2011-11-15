# == Schema Information
#
# Table name: calificaciones
#
#  id                    :integer(4)      not null, primary key
#  puntualidad           :integer(4)
#  amigable              :integer(4)
#  conocimiento          :integer(4)
#  claridad              :integer(4)
#  flexibilidad          :integer(4)
#  promedio              :float
#  comentarios           :string(255)
#  facilidad             :integer(4)
#  calificacion_obtenida :float
#  usuario_id            :integer(4)
#  curso_profesor_id     :integer(4)
#  created_at            :datetime
#  updated_at            :datetime
#

class Calificacion < ActiveRecord::Base
  attr_protected :usuario_id, :promedio
  has_many :comentarios, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :flags, :dependent => :destroy
  belongs_to :usuario
  
  belongs_to :curso_profesor
  delegate :profesor, :curso, :to => :curso_profesor
  
  before_save :calcula_promedio

  validates_numericality_of :puntualidad, :amigable, :conocimiento, :claridad,
                            :flexibilidad, :facilidad
  validates_numericality_of :calificacion_obtenida, :allow_nil => true
  validates_inclusion_of :puntualidad, :amigable, :conocimiento,
                          :claridad, :flexibilidad, :facilidad, :in => (0..10)
  validates_inclusion_of :calificacion_obtenida, :in => (0..100), :allow_nil => true, :message => "xx"
  validates_uniqueness_of :usuario_id, :scope => [:curso_profesor_id], :message => "ya has comentado aqui"
  
  default_scope order('likes_count DESC')
  default_scope order('created_at DESC')
  
  def calcula_promedio
    self.promedio = (self.puntualidad + self.amigable + self.conocimiento + self.claridad + self.flexibilidad) / 5
  end

end
