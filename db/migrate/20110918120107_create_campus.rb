class CreateCampus < ActiveRecord::Migration
  def self.up
    create_table :campus do |t|
      t.string :nombre
      t.string :ciudad
      t.string :estado
      t.integer :universidad_id

      t.timestamps
    end
  end

  def self.down
    drop_table :campus
  end
end
