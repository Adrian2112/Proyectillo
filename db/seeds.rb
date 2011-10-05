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

#Creacion de universidades
["UDEM", "ITESM", "UANL", "ITAM", "UNAM", "Colegio de Mexico", "Politecnico", "Universidad del Valle de Mexico"].each do |universidad|
  Universidad.create!(:nombre => universidad)
end

#Creacion de cmpus
(1..15).each do
  ciudad = Faker::Address.city
  Campus.create!(:nombre => "Campus " + ciudad,
                 :ciudad => ciudad,
                 :estado => Faker::Address.state,
                 :universidad_id => Random.new.rand(1..8))
end

#Creacion de cursos
["Sistemas Inteligentes", "Compiladores", "Etica", 
 "Optimizacion", "Produccion Digital", "Metodos Cuantitativos", 
 "Matematicas Discretas", "Teoria de la computacion", "Ecuaciones Diferenciales",
 "Programacion Avanzada", "AMSS", "Algoritmos", "Bases de datos", "Organizacion Computacional",
 "Matematicas para Ingenieria I","Matematicas para Ingenieria II", "Matematicas para Ingenieria III",
 "Perspectiva", "Optativa I", "Optativa II", "APIS", "Lenguajes de Programacion" ].each do |curso|
  Curso.create!(:nombre => curso,
                :campus_id => Random.new.rand(1..15))
end



#Creacion de profesores
(1..15).each do
  nombre = Faker::Name.name
  apellido_paterno = Faker::Name.last_name
  apellido_materno = Faker::Name.last_name 
  Profesor.create!(:nombre => nombre,
                   :apellido_paterno => apellido_paterno,
                   :apellido_materno => apellido_materno,
                   :campus_id => Random.new.rand(1..15))
end

#Creacion de cursos con profesores
(1..15).each do
  CursoProfesor.create!(:curso_id => Random.new.rand(1..15),
                        :profesor_id => Random.new.rand(1..22))
end

#Creacion de usuarios base
Usuario.create!(:username => "kurenn",
                :email => "abraham.kuri@gmail.com",
                :password => "frxhgroi",
                :password_confirmation => "frxhgroi")
                
Usuario.create!(:username => "adrian",
                :email => "adrian@gmail.com",
                :password => "borrego",
                :password_confirmation => "borrego")

Usuario.create!(:username => "edo",
                :email => "edo@head.com",
                :password => "double2",
                :password_confirmation => "double2")