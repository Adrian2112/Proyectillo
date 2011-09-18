class CreateProfesores < ActiveRecord::Migration
  def self.up
    create_table :profesores do |t|
      t.string :nombre
      t.string :apellido_materno
      t.string :apellido_paterno
      t.integer :campus_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profesores
  end
end
