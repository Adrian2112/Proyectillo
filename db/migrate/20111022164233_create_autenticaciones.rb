class CreateAutenticaciones < ActiveRecord::Migration
  def self.up
    create_table :autenticaciones do |t|
      t.integer :usuario_id
      t.string :provedor
      t.string :uid
      t.timestamps
    end
  end

  def self.down
    drop_table :autenticaciones
  end
end
