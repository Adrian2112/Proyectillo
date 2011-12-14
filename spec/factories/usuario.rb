Factory.define :usuario do |f|
  f.sequence(:email) {|n| "user#{n}@calmecac.me" }
  f.sequence(:username) {|n| "user#{n}"}
  f.rol "Usuario"
  f.campus_id 1
  f.universidad_id 1
  f.password "calmecac"
  f.password_confirmation "calmecac"
end