class CreatePropuestas < ActiveRecord::Migration
  def self.up
    create_table :propuestas do |t|
      t.string :titulo
      t.text :descripcion
      t.string :categoria
      t.integer :usuario_id
      t.integer :campus_id

      t.timestamps
    end
  end

  def self.down
    drop_table :propuestas
  end
end
