# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :propuesta do
    titulo "MyString"
    descripcion "MyText"
    categoria "MyString"
    comentario_propuesta_id 1
  end
end
