class CreateCalificaciones < ActiveRecord::Migration
  def self.up
    create_table :calificaciones do |t|
      t.float :puntualidad, :default => 0.0
      t.float :amigable, :default => 0.0
      t.float :conocimiento, :default => 0.0
      t.float :claridad, :default => 0.0
      t.float :flexibilidad, :default => 0.0
      t.float :promedio
      t.string :comentarios
      t.float :facilidad, :default => 0.0
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
