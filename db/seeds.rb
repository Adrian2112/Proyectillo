# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'rubygems'
require 'faker'
Faker::Config.locale = "en"
UNIVERSIDADES = ["UDEM", "ITESM", "UANL", "ITAM", "UNAM", "Colegio de Mexico",
                  "Politecnico", "Universidad del Valle de Mexico"]
CURSOS = ["Sistemas Inteligentes", "Compiladores", "Etica", 
 "Optimizacion", "Produccion Digital", "Metodos Cuantitativos", 
 "Matematicas Discretas", "Teoria de la computacion", "Ecuaciones Diferenciales",
 "Programacion Avanzada", "AMSS", "Algoritmos", "Bases de datos", "Organizacion Computacional",
 "Matematicas para Ingenieria I","Matematicas para Ingenieria II", "Matematicas para Ingenieria III",
 "Perspectiva", "Optativa I", "Optativa II", "APIS", "Lenguajes de Programacion" ]
 

#Creacion de universidades
UNIVERSIDADES.each do |universidad|
  u = Universidad.create!(:nombre => universidad)

  # asigna un numero aleatorio entre 1 y 3 de campus a cada universidad
  size = Random.new.rand(1..3)
  size.times do
    ciudad = Faker::Address.city
    campus_actual = Campus.create!(:nombre => "Campus " + ciudad,
                   :ciudad => ciudad,
                   :estado => Faker::Address.state,
                   :universidad => u)
    
    # crea entre 1 y 5 cursos al campus actual
    CURSOS.sample(Random.new.rand(1..5)).each do |curso|
      curso_actual = Curso.create!(:nombre => curso,
                                  :campus => campus_actual)
      
      # crea un profesor para el curso actual
      nombre = Faker::Name.name
      apellido_paterno = Faker::Name.last_name
      apellido_materno = Faker::Name.last_name
      profesor_actual = Profesor.create!(:nombre => nombre,
                                         :apellido_paterno => apellido_paterno,
                                         :apellido_materno => apellido_materno,
                                         :campus => campus_actual)
      
      profesor_actual.cursos << curso_actual
    end
    
  end
end

#Creacion de usuarios base
Usuario.create(:username => "kurenn",
                :email => "abraham.kuri@gmail.com",
                :password => "frxhgroi",
                :password_confirmation => "frxhgroi",
                :universidad_id => Universidad.first.id,
                :campus_id => Universidad.first.campus.first.id)
                
Usuario.create(:username => "adrian",
                :email => "adrian@gmail.com",
                :password => "borrego",
                :password_confirmation => "borrego",
                :universidad_id => Universidad.first.id,
                :campus_id => Universidad.first.campus.first.id)

Usuario.create(:username => "edo",
                :email => "edo@head.com",
                :password => "double2",
                :password_confirmation => "double2",
                :universidad_id => Universidad.first.id,
                :campus_id => Universidad.first.campus.first.id)