class Autenticacion < ActiveRecord::Base
  belongs_to :usuario

  def twitter?
    provedor == 'twitter'  
  end
end
