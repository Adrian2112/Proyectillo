# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


["UDEM", "ITESM", "UANL", "ITAM", "UNAM", "Colegio de Mexico", "Politecnico", "Universidad del Valle de Mexico"].each do |universidad|
  Universidad.create!(:nombre => universidad)
end


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