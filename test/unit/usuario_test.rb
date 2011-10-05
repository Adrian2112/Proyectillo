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

require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  def new_usuario(attributes = {})
    attributes[:username] ||= 'foo'
    attributes[:email] ||= 'foo@example.com'
    attributes[:password] ||= 'abc123'
    attributes[:password_confirmation] ||= attributes[:password]
    usuario = Usuario.new(attributes)
    usuario.valid? # run validations
    usuario
  end

  def setup
    Usuario.delete_all
  end

  def test_valid
    assert new_usuario.valid?
  end

  def test_require_username
    assert new_usuario(:username => '').errors[:username]
  end

  def test_require_password
    assert new_usuario(:password => '').errors[:password]
  end

  def test_require_well_formed_email
    assert new_usuario(:email => 'foo@bar@example.com').errors[:email]
  end

  def test_validate_uniqueness_of_email
    new_usuario(:email => 'bar@example.com').save!
    assert new_usuario(:email => 'bar@example.com').errors[:email]
  end

  def test_validate_uniqueness_of_username
    new_usuario(:username => 'uniquename').save!
    assert new_usuario(:username => 'uniquename').errors[:username]
  end

  def test_validate_odd_characters_in_username
    assert new_usuario(:username => 'odd ^&(@)').errors[:username]
  end

  def test_validate_password_length
    assert new_usuario(:password => 'bad').errors[:password]
  end

  def test_require_matching_password_confirmation
    assert new_usuario(:password_confirmation => 'nonmatching').errors[:password]
  end

  def test_generate_password_hash_and_salt_on_create
    usuario = new_usuario
    usuario.save!
    assert usuario.password_hash
    assert usuario.password_salt
  end

  def test_authenticate_by_username
    Usuario.delete_all
    usuario = new_usuario(:username => 'foobar', :password => 'secret')
    usuario.save!
    assert_equal usuario, Usuario.authenticate('foobar', 'secret')
  end

  def test_authenticate_by_email
    Usuario.delete_all
    usuario = new_usuario(:email => 'foo@bar.com', :password => 'secret')
    usuario.save!
    assert_equal usuario, Usuario.authenticate('foo@bar.com', 'secret')
  end

  def test_authenticate_bad_username
    assert_nil Usuario.authenticate('nonexisting', 'secret')
  end

  def test_authenticate_bad_password
    Usuario.delete_all
    new_usuario(:username => 'foobar', :password => 'secret').save!
    assert_nil Usuario.authenticate('foobar', 'badpassword')
  end
end
