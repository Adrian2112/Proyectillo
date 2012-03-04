FactoryGirl.define do
    factory :calificacion do
      puntualidad 5
      amigable 4
      conocimiento 5
      claridad 3
      flexibilidad 9
      promedio 5
      facilidad 8
      calificacion_obtenida 95
      association :usuario, :factory => :usuario
      association :curso_profesor, :factory => :curso_profesor
    end
end