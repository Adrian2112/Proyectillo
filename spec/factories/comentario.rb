FactoryGirl.define do
  factory :comentario do
    comentario "Esto es un buen comentario"
    association :usuario, :factory => :usuario
    association :calificacion, :factory => :calificacion
  end
end