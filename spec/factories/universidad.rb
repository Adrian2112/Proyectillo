FactoryGirl.define do 
  factory :universidad do
    sequence(:nombre){|i| "Universidad #{i}"}
  end
end