Factory.define :campus do |f|
  f.sequence(:nombre) {|i| "Campus Monterrey #{i}"}
  f.ciudad  "Monterrey"
  f.estado  "Nuevo Leon"
  f.sequence(:universidad_id) {|i| i}
end