class CreateCalificaciones < ActiveRecord::Migration
  def self.up
    create_table :calificaciones do |t|
      t.integer :puntualidad
      t.integer :amigable
      t.integer :conocimiento
      t.integer :claridad
      t.integer :flexibilidad
      t.float :promedio
      t.string :comentarios
      t.integer :facilidad
      t.float :calificacion_obtenida
      t.integer :usuario_id
      t.integer :curso_profesor_id
      t.timestamps
    end
  end

  def self.down
    drop_table :calificaciones
  end
end
