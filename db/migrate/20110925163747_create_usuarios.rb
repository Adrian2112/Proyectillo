class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :rol, :default => "Usuario"
      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
