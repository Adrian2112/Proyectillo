FactoryGirl.define do
  factory :autenticacion do
    sequence(:provedor) {|n| "Facebook #{n}" }
    uid           "123"
    association :usuario, :factory => :usuario
  end
end
