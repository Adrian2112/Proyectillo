FactoryGirl.define do
  factory :campus do
    sequence(:nombre) {|i| "Campus Monterrey #{i}"}
    ciudad  "Monterrey"
    estado  "Nuevo Leon"
    association :universidad, :factory => :universidad
  end
end