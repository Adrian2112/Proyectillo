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

require 'spec_helper'

describe Usuario do
  let(:usuario){Factory(:usuario)}
  let(:calificacion){Factory(:calificacion)}
  
  describe 'Validations' do
    context 'user is valid' do
      it 'with all the attributes' do
        usuario.should be_valid
      end
    end
    
    context 'user is not valid' do
      it 'without username' do
        usuario.username = nil
        usuario.should_not be_valid
      end
      
      it 'with duplicated username' do
        otro_usuario = Factory.build(:usuario, :username => usuario.username)
        otro_usuario.should_not be_valid
      end
      
      it 'without email' do
        usuario.email = nil
        usuario.should_not be_valid
      end
      
      it 'with duplicated email' do
        otro_usuario = Factory.build(:usuario, :email => usuario.email)
        otro_usuario.should_not be_valid
      end
      
      it 'with bad formatted email' do
        usuario.email = "bad email"
        usuario.should_not be_valid
      end
      
      it 'with email case sensitive' do
        otro_usuario = Factory.build(:usuario, :email => usuario.email.upcase)
        otro_usuario.should_not be_valid
      end
      
      it 'without password' do
        usuario.password = nil
        usuario.should_not be_valid
      end
      
      it 'with not matching passwords' do
        usuario.password_confirmation = "invalid_password"
        usuario.should_not be_valid
      end
      
      it 'without rol' do
        usuario.rol = nil
        usuario.should_not be_valid
      end
      
      it 'without universidad' do
        usuario.universidad = nil
        usuario.should_not be_valid
      end
      
      it 'without campus' do
        usuario.campus = nil
        usuario.should_not be_valid
      end
      
      it 'with not valid rol' do
        usuario.rol = "SuperAdmin"
        usuario.should_not be_valid
      end
    end
  end
  describe 'Instance methods' do
    describe '#admin?' do 
      it 'returns false when is not admin' do
        usuario.rol = "Usuario"
        usuario.admin?.should be_false
      end
      it 'returns true when is admin' do
        usuario.rol = "Administrador"
        usuario.admin?.should be_true
      end
    end
    describe '#usuario?' do
      it 'returns true if user rol is Usuario' do
        usuario.rol = "Usuario"
        usuario.usuario?.should be_true
      end
      it 'return false if user rol is not Usuario' do
        usuario.rol = "Administrador"
        usuario.usuario?.should be_false
      end
    end
    describe "#password_required?" do
      it 'should return false if autenticaciones is not empty' do
        usuario.autenticaciones << Factory(:autenticacion)
        usuario.password_required?.should be_false
      end
      it 'should inherit from super if autenticaciones is empty' do
        usuario.autenticaciones = []
        usuario.password_required?.should_not be_false
      end
    end
    describe "#has_no_password?" do
      it 'should return true if encryted password is blank' do
        usuario.has_no_password?.should be_false
      end
      it 'should return false if encrypted password is blank' do
        usuario.encrypted_password = ""
        usuario.has_no_password?.should be_true
      end
    end
    describe "#already_liked?" do
      it 'should return the first like with given calificacion_id' do
        like = Factory(:like, :calificacion_id => calificacion.id, :usuario_id => usuario.id)
        usuario.already_liked?(calificacion.id).should == like
      end
      
      it 'should return an empty array when no like is found' do
        usuario.likes = []
        usuario.already_liked?(calificacion.id).should == nil
      end
    end
    describe "#already_flagged?" do
      it 'should return the first like with given calificacion_id' do
        flag = Factory(:flag, :calificacion_id => calificacion.id, :usuario_id => usuario.id)
        usuario.already_flagged?(calificacion.id).should == flag
      end
      
      it 'should return an empty array when no like is found' do
        usuario.flags = []
        usuario.already_flagged?(calificacion.id).should == nil
      end
    end
    describe "#update_with_password" do
      it 'updates the user if user has no password' do
        usuario.encrypted_password = ''
        usuario.email = "email@email.com"
        usuario.update_with_password
        usuario.email.should == "email@email.com"
      end 
      it 'does not update the user if user has password' do
        usuario.email = "email@email.com"
        usuario.update_with_password
        usuario.email.should_not == Usuario.find(usuario.id).email
      end
    end
    describe "#find_for_authentication" do
      it 'should return the user record find by username' do
        Usuario.find_for_authentication({:login => usuario.username}).should == usuario
      end
      it 'should return the user record find by email' do
        Usuario.find_for_authentication({:login => usuario.email}).should == usuario
      end
      it 'should return nil if no user is found' do
        Usuario.find_for_authentication({:login => "usuario.email"}).should be_nil
      end
    end
    describe "#apply_omniauth" do
      it 'should build a new autenticacion without username and email' do
        usuario.email = ''
        usuario.username = ''
        omniauth = {'user_info' => {'email' => usuario.email, 'nickname' => usuario.username}}
        usuario.apply_omniauth(omniauth).should_not be_nil
      end
      it 'should build a new autenticacion with email and username' do
        omniauth = {'user_info' => {'email' => usuario.email, 'nickname' => usuario.username}}
        usuario.apply_omniauth(omniauth).should_not be_nil
      end
      it 'should build a new autenticacion without email' do
        usuario.email = ''
        omniauth = {'user_info' => {'email' => usuario.email, 'nickname' => usuario.username}}
        usuario.apply_omniauth(omniauth).should_not be_nil
      end
      it 'should build a new autenticacion without email' do
        usuario.username = ''
        omniauth = {'user_info' => {'email' => usuario.email, 'nickname' => usuario.username}}
        usuario.apply_omniauth(omniauth).should_not be_nil
      end
    end
  end
end
