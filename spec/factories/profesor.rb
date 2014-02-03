FactoryGirl.define do
	factory :profesor do
		nombre "Antonio"
		apellido_paterno "Mejorado"
		apellido_materno "Gonzalez"
		association :campus, :factory => :campus
		cursos {|a| [a.association(:curso)]}
	end
end
