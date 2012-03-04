FactoryGirl.define do
  factory :curso_profesor do
    association :curso, :factory => :curso
    association :profesor, :factory => :profesor
  end
end