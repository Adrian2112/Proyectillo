require 'spec_helper'

describe Campus do
  let(:campus){Factory(:campus)}
  
  describe 'Validations' do
    context 'Campus is valid' do
      it 'with all the attributes' do
        campus.should be_valid
      end
      it 'without ciudad' do
        campus.ciudad = nil
        campus.should be_valid
      end
      it 'without estado' do
        campus.estado = nil
        campus.should be_valid
      end
    end
    
    context 'Campus is not valid' do
      it 'with duplicated nombre' do
        campus_2 = Factory.build(:campus, :nombre => campus.nombre, :universidad_id => campus.universidad_id)
        campus_2.should_not be_valid
      end
    end
  end
  
  describe 'Instance methos' do
    describe '#to_s' do
      it 'should return the name of the campus' do
        campus.to_s.should eql campus.nombre
      end
    end
  end
  
  describe 'relations' do
    context 'universidad' do
      it 'should be related to one universidad' do
        campus.universidad.should_not be_nil
      end
    end
    
    context 'cursos' do
      it 'should return an empty array when no cursos are related' do
        campus.cursos.should == []
      end
      it 'should return an array of 3 cursos when 3 cursos are related' do
        3.times{campus.cursos << Factory(:curso, :campus_id => campus.id)}
        campus.cursos.count.should eql 3
      end
    end
    
    context 'profesores' do
      it 'should return an empty array when no profesores are related' do
        campus.profesores.should == []
      end
      it 'should return an array of 3 profesores when 3 profesores are related' do
        3.times{campus.profesores << Factory(:profesor, :campus_id => campus.id)}
        campus.profesores.count.should eql 3
      end
    end
    
    context 'usuarios' do
      it 'should return and empty array when no usuarios are related' do
        campus.usuarios.should == []
      end
      it 'should return an array of 3 when 3 usuarios are related' do
        3.times{campus.usuarios << Factory(:usuario, :campus_id => campus.id)}
        campus.usuarios.count.should eql 3
      end
    end
  end
  
end