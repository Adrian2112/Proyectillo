Factory.define :curso_profesor do |f|
  f.curso {|a| a.association(:curso)}
  f.profesor {|a| a.association(:profesor)}
end