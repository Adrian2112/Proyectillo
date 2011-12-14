Factory.define :curso do |f|
  f.sequence(:nombre) {|i| "Matematicas #{i}"}
  f.sequence(:campus_id) {|i| i}
end