class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.text :comentario
      t.integer :usuario_id
      t.integer :calificacion_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
