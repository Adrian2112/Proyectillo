# == Schema Information
#
# Table name: calificaciones
#
#  id                    :integer(4)      not null, primary key
#  puntualidad           :float           default(0.0)
#  amigable              :float           default(0.0)
#  conocimiento          :float           default(0.0)
#  claridad              :float           default(0.0)
#  flexibilidad          :float           default(0.0)
#  promedio              :float
#  critica               :text
#  facilidad             :float           default(0.0)
#  calificacion_obtenida :float
#  usuario_id            :integer(4)
#  curso_profesor_id     :integer(4)
#  likes_count           :integer(4)      default(0)
#  flags_count           :integer(4)      default(0)
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
  
  before_validation :calcula_promedio

  validates :puntualidad, :amigable, :conocimiento, 
            :claridad, :flexibilidad, :facilidad, :numericality => true,
                                                  :inclusion => {:in => (0..10)}
                            
  validates :calificacion_obtenida, :numericality => {:allow_nil => true},
                                    :inclusion => {:in => (0..100), :allow_nil => true, :message => "xx"}
  
  validates :usuario_id, :uniqueness => {:scope => [:curso_profesor_id], :message => "ya has comentado aqui"}
  validates :promedio, :presence => true
  
  default_scope order('likes_count DESC, created_at DESC')
  
  def calcula_promedio
    self.promedio = (self.puntualidad + self.amigable + self.conocimiento + self.claridad + self.flexibilidad) / 5
  end

end
