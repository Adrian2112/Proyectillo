class CreateFlags < ActiveRecord::Migration
  def self.up
    create_table :flags do |t|
      t.integer :usuario_id
      t.integer :calificacion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :flags
  end
end
