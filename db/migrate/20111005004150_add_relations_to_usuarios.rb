class AddRelationsToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :campus_id, :integer
    add_column :usuarios, :universidad_id, :integer
  end

  def self.down
    remove_column :usuarios, :universidad_id
    remove_column :usuarios, :campus_id
  end
end
