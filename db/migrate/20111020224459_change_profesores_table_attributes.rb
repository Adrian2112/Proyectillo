class ChangeProfesoresTableAttributes < ActiveRecord::Migration
  def self.up
    remove_column :profesores, :imagen_file_name   
    remove_column :profesores, :imagen_content_type
    remove_column :profesores, :imagen_file_size   
    remove_column :profesores, :imagen_updated_at 
    
    add_column :profesores, :avatar, :string 
    
  end

  def self.down
    add_column :profesores, :imagen_file_name   
    add_column :profesores, :imagen_content_type
    add_column :profesores, :imagen_file_size   
    add_column :profesores, :imagen_updated_at
    
    remove_column :profesores, :avatar
  end
end
