class AddImagenToProfesor < ActiveRecord::Migration
  def self.up
    add_column :profesores, :imagen_file_name, :string
    add_column :profesores, :imagen_content_type, :string
    add_column :profesores, :imagen_file_size, :integer
    add_column :profesores, :imagen_updated_at, :datetime
  end

  def self.down
    remove_column :profesores, :imagen_updated_at
    remove_column :profesores, :imagen_file_size
    remove_column :profesores, :imagen_content_type
    remove_column :profesores, :imagen_file_name
  end
end
