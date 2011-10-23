class ChangeCalifacionesTable < ActiveRecord::Migration
  def self.up
      change_table :calificaciones do |t|
        t.rename :comentarios, :critica
      end
      change_column :calificaciones, :critica, :text
    end
  
  def self.down
    change_table :calificaciones do |t|
      t.rename :critica, :comentarios
    end
    change_column :calificaciones, :comentarios, :string
  end
end
