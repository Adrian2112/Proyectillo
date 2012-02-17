FactoryGirl.define do
  factory :flag do
    association :usuario, :factory => :usuario
    association :calificacion, :factory => :calificacion
  end
end