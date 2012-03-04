FactoryGirl.define do
  factory :usuario do 
    sequence(:email) {|n| "user#{n}@calmecac.me" }
    sequence(:username) {|n| "user#{n}"}
    rol "Usuario"
    association :campus, :factory => :campus
    association :universidad, :factory => :universidad
    password "calmecac"
    password_confirmation "calmecac"
  end
end