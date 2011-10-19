# == Schema Information
#
# Table name: usuarios
#
#  id            :integer(4)      not null, primary key
#  username      :string(255)
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  rol           :string(255)     default("Usuario")
#  created_at    :datetime
#  updated_at    :datetime
#

class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # Atributos de devise con los que habian sido generados anteriormente
  attr_accessible :username, :email, :password, :password_confirmation,
                  :campus_id, :universidad_id, :remember_me, :login

  attr_accessor :login
  
  has_many :comentarios, :dependent => :nullify
  has_many :calificaciones, :dependent => :nullify
  belongs_to :universidad
  belongs_to :campus
  
  ROLES = ["Usuario", "Administrador"]
  
  validates_inclusion_of :rol, :in => ROLES
  validates :campus_id, :presence => true
  validates :universidad_id, :presence => true


  def self.find_for_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end

end
