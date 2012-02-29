class CreatePropuestasTags < ActiveRecord::Migration
  def self.up
    create_table :propuestas_tags do |t|
      t.integer :propuesta_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :propuestas_tags
  end
end
