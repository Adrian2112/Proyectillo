FactoryGirl.define do
  factory :like do
    association :usuario, :factory => :usuario
    association :calificacion, :factory => :calificacion
  end
  
end