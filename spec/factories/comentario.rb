Factory.define :comentario do |f|
  f.comentario "Esto es un buen comentario"
  f.usuario {|a| a.association(:usuario)}
  f.calificacion {|a| a.association(:calificacion)}
end