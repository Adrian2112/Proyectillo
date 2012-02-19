class AddSlugToCampus < ActiveRecord::Migration
  def self.up
    add_column :campus, :slug, :string
    add_index :campus, :slug
  end

  def self.down
    remove_column :campus, :slug
  end
end
