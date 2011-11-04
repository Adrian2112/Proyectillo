class CreateCalificaciones < ActiveRecord::Migration
  def self.up
    create_table :calificaciones do |t|
      t.integer :puntualidad, :default => 0
      t.integer :amigable, :default => 0
      t.integer :conocimiento, :default => 0
      t.integer :claridad, :default => 0
      t.integer :flexibilidad, :default => 0
      t.float :promedio
      t.string :comentarios
      t.integer :facilidad, :default => 0
      t.float :calificacion_obtenida
      t.integer :usuario_id
      t.integer :curso_profesor_id
      t.integer :likes_count, :default => 0
      t.integer :flags_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :calificaciones
  end
end
