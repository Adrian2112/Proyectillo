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
  attr_accessible :username, :email, :password, :password_confirmation, :campus_id, :universidad_id, :remember_me
  
  has_many :comentarios, :dependent => :nullify
  has_many :calificaciones, :dependent => :nullify
  
  ROLES = ["Usuario", "Administrador"]
  
  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :username #, :campus_id, :universidad_id
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_inclusion_of :rol, :in => ROLES
  
  belongs_to :universidad
  belongs_to :campus
  
  # login can be either username or email address
  def self.authenticate(login, pass)
    usuario = find_by_username(login) || find_by_email(login)
    return usuario if usuario && usuario.matching_password?(pass)
  end

  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end
end
