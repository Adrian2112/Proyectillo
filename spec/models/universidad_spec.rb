# == Schema Information
#
# Table name: universidades
#
#  id         :integer(4)      not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Universidad do
  let(:universidad) {Factory(:universidad)}
  
  describe 'Validations' do
    context 'Universidad is valid' do
      it 'should be valid with all attributes' do
        universidad.should be_valid
      end
    end
    
    context 'Universidad is not valid' do
      it 'without nombre' do
        universidad.nombre = nil
        universidad.should_not be_valid
      end
      
      it 'with duplicated nombre' do
        universidad_2 = Factory.build(:universidad, :nombre => universidad.nombre)
        universidad_2.should_not be_valid
      end
    end
    
  end
  
  describe 'Instance methods' do
    describe '#to_s' do
      it 'should return the universidad nombre' do
        universidad.to_s.should eql universidad.nombre
      end
    end
    
    describe '#nombres' do
     it 'should return the campus name ' do
       universidad.campus << Factory(:campus)
       universidad.nombres.should == universidad.campus.map(&:nombre).join(",")
     end
     it 'should return the campus nombres with a comma separated' do
       3.times { universidad.campus.push Factory(:campus) }
       universidad.nombres.should == universidad.campus.map(&:nombre).join(",")
     end
     it 'should return an empty string if no campus related' do
       universidad.campus = []
       universidad.nombres.should be_blank
     end
    end
  end
  
  describe 'Relations' do
    context 'Campus relations' do
      it 'should return an empty array if no campus are related' do
        universidad.campus.should == []
      end
      it 'should return an array of 3 campus when related to 3 campus' do
        3.times { Factory(:campus, :universidad_id => universidad.id) }
        universidad.campus.count.should eql 3 
      end
    end
    
    context 'Profesores relations' do
      it 'should return an empty array if no profesores are related' do
        universidad.profesores.should == []
      end
      it 'should return an array of 3 profesores when related to 3 profesores' do
        campus = Factory(:campus, :universidad_id => universidad.id)
        3.times {campus.profesores << Factory(:profesor, :campus_id => campus.id)}
        universidad.profesores.count.should eql 3
      end
    end
    
    context 'Usuarios relations' do
      it 'should return an empty array if no usuarios are related' do
        universidad.usuarios.should == []
      end
      it 'should return an array of 3 usuarios when related to 3 usuarios' do
        3.times {Factory(:usuario, :universidad_id => universidad.id)}
        universidad.usuarios.count.should eql 3
      end
    end
    
  end
end
