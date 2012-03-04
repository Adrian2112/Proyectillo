class CreateAbreviaciones < ActiveRecord::Migration
  def self.up
    create_table :abreviaciones do |t|
      t.string :nombre
      t.integer :universidad_id

      t.timestamps
    end
  end

  def self.down
    drop_table :abreviaciones
  end
end
