class AddSlugToProfesores < ActiveRecord::Migration
  def self.up
    add_column :profesores, :slug, :string
    add_index :profesores, :slug
  end

  def self.down
    remove_column :profesores, :slug
  end
end
