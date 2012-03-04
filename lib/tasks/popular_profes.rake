#encoding: utf-8
task :crear_profesores => :environment do
  profesores = []
  file = File.new("#{Rails.root}/lib/tasks/profes_utf-8.csv", "r", :encoding => "UTF-8")
  profesores_monterrey = File.new("#{Rails.root}/lib/tasks/profes.txt", "r", :encoding => "UTF-8")
  
   puts "Estoy procesando..."
  
  while(line = profesores_monterrey.gets)
    apellido_paterno, apellido_materno, nombre = line.chomp.split(",")
    unless p = Profesor.where("nombre = '#{nombre}' AND apellido_materno = '#{apellido_materno}' AND apellido_materno = '#{apellido_materno}'").first
      p = Profesor.new(:nombre => nombre, :apellido_paterno => apellido_paterno, :apellido_materno => apellido_materno)
      p.campus_id = 1
      p.save(false)
    end
  end
  
 
  while (line = file.gets)
    curso, nombre, apellido_paterno, apellido_materno = line.chomp.split("|")
    c = Curso.find_by_nombre(curso)
    if p = Profesor.where("nombre = '#{nombre}' AND apellido_materno = '#{apellido_materno}' AND apellido_materno = '#{apellido_materno}'").first
      if c
        #debugger
        unless Curso.joins(:profesores).where("cursos_profesores.profesor_id" => p.id, :id => c.id)
          p.cursos << c
        end
      else
        p.cursos << Curso.create(:nombre => curso, :campus_id => 1)
      end
    end
  end
  #puts profesores.uniq.size
  file.close
  
end