# == Schema Information
#
# Table name: usuarios
#
#  id                     :integer(4)      not null, primary key
#  username               :string(255)
#  rol                    :string(255)     default("Usuario")
#  created_at             :datetime
#  updated_at             :datetime
#  campus_id              :integer(4)
#  universidad_id         :integer(4)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # Atributos de devise con los que habian sido generados anteriormente
  attr_accessible :username, :email, :password, :password_confirmation,
                  :campus, :campus_id, :universidad, :universidad_id, :remember_me, :login

  attr_accessor :login
  
  has_many :autenticaciones
  has_many :comentarios, :dependent => :nullify
  has_many :calificaciones, :dependent => :nullify
  belongs_to :universidad
  belongs_to :campus
  
  ROLES = ["Usuario", "Administrador"]
  
  validates_inclusion_of :rol, :in => ROLES
  validates :campus_id, :presence => true
  validates :universidad_id, :presence => true
  
  def admin?
    self.rol == ROLES[1]
  end
  
  def usuario?
    self.rol == ROLES[0]
  end

  def self.find_for_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end

end
