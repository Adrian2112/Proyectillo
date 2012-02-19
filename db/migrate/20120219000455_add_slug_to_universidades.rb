class AddSlugToUniversidades < ActiveRecord::Migration
  def self.up
    add_column :universidades, :slug, :string
    add_index :universidades, :slug
  end

  def self.down
    remove_column :universidades, :slug
  end
end
