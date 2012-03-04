FactoryGirl.define do 
    factory :curso do
      sequence(:nombre) {|i| "Curso #{i}"}
      association :campus, :factory => :campus
    end
end