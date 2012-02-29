class PropuestaTag < ActiveRecord::Base
  belongs_to :propuesta
  belongs_to :tag
end
