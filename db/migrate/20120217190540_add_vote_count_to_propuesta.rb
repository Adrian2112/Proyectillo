class AddVoteCountToPropuesta < ActiveRecord::Migration
  def self.up
    add_column :propuestas, :votes_count, :integer, :default => 0
  end

  def self.down
    remove_column :propuestas, :votes_count
  end
end
