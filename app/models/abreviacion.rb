class Abreviacion < ActiveRecord::Base
  belongs_to :universidad
  searchable do
    text :nombre
  end
end
