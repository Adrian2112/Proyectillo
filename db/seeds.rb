# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


  CIUDADES = ["Aguascalientes", "Veracruz", "Chihuahua", "Ciudad de México", "Ciudad Juárez", 
            "Ciudad Obregón", "Cuernavaca", "Estado de México", "Guadalajara", "Hidalgo",
            "Irapuato", "Laguna", "León", "Mazatlán", "Monterrey", "Morelia",
            "Puebla", "Querétaro", "Saltillo", "San Luis Potosí", "Santa Fe", "Sinaloa",
            "Sonora Norte", "Tampico", "Toluca", "Zacatecas"]
 
  ESTADOS = ["Aguascalientes", "Veracruz", "Chihuahua", "Distrito Federal", "Chihuahua", 
            "Sonora", "Morelos", "Estado de México", "Jalisco", "Hidalgo",
            "Guanuajuato", "Coahuila", "Guanuajuato", "Sinaloa", "Nuevo León", "Michoacán",
            "Puebla", "Querétaro", "Coahuila", "San Luis Potosí", "Distrito Federal", "Sinaloa",
            "Sonora", "Tamaulipas", "Estado de México", " Zacatecas"]
            
#Creacion de universidad
u = Universidad.create!(:nombre => "Instituto Tecnológico y de Estudios Superiores de Monterrey")


Campus.create!(:nombre => "Campus Monterrey",
               :ciudad => "Monterrey",
               :estado => "Nuevo León",
               :universidad => u)


#Creacion de usuarios base
u = Usuario.create(:username => "kurenn",
                    :email => "abraham.kuri@gmail.com",
                    :password => "frxhgroi",
                    :password_confirmation => "frxhgroi",
                    :universidad_id => 1,
                    :campus_id => 1)
u.rol = "Administrador"
u.save
                
u = Usuario.create(:username => "adrian",
                :email => "adrian@gmail.com",
                :password => "borrego",
                :password_confirmation => "borrego",
                :universidad_id => 1,
                :campus_id => 1)
u.rol = "Administrador"
u.save

u = Usuario.create(:username => "edo",
                :email => "edo@head.com",
                :password => "double2",
                :password_confirmation => "double2",
                :universidad_id => 1,
                :campus_id => 1)
u.rol = "Administrador"
u.save