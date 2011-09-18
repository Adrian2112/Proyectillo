class CreateUniversidades < ActiveRecord::Migration
  def self.up
    create_table :universidades do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :universidades
  end
end
