class CreateCursosProfesores < ActiveRecord::Migration
  def self.up
    create_table :cursos_profesores do |t|
      t.integer :curso_id
      t.integer :profesor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cursos_profesores
  end
end
