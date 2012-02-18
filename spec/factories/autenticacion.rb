FactoryGirl.define do
  factory :autenticacion do
    sequence(:provedor) {|n| "Facebook #{n}" }
    uid           "123"
    association :usuario, :factory => :usuario
    
    factory :twitter do
      provedor "Twitter"
    end
    
    factory :facebook do
      provedor "Facebook"
    end
  end
end
