FactoryGirl.define do
  factory :usuario do 
    sequence(:email) {|n| "user#{n}@calmecac.me" }
    sequence(:username) {|n| "user#{n}"}
    rol "Usuario"
    campus_id 1
    universidad_id 1
    password "calmecac"
    password_confirmation "calmecac"
  end
end