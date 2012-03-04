# == Schema Information
#
# Table name: cursos
#
#  id         :integer(4)      not null, primary key
#  nombre     :string(255)
#  campus_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Curso do
  let(:curso) {Factory(:curso)}
  
  describe 'validations' do
    context 'is valid' do
      it 'with all attributes' do
        curso.should be_valid
      end
    end
    
    context 'is not valid' do
      it 'without nombre' do
        curso.nombre = nil
        curso.should_not be_valid
      end
      it 'without campus_id' do
        curso.campus_id = nil
        curso.should_not be_valid
      end
      it 'should have duplicated nombre in campus scope' do
        otro_curso = Factory.build(:curso, :nombre => curso.nombre, :campus_id => curso.campus_id)
        otro_curso.should_not be_valid
      end
    end
  end
  describe 'instance methods' do
    context '#to_s' do
      it 'returns the nombre' do
        curso.to_s.should eql(curso.nombre)
      end
    end
    context '#delegate universidad to campus' do
      it 'should be able to access universidad by delegation' do
        curso.universidad.should_not be_nil
      end
    end
  end
  describe 'associations' do
    context 'campus' do
      it 'returns the campus which belongs to' do
        curso.campus.should_not be_nil
      end
    end
    context 'curso_profesor' do
      it 'without curso profesores' do
        curso.curso_profesor.should == []
      end
      it 'with 3 curso profesores' do
        3.times{Factory(:curso_profesor, :curso_id => curso.id)}
        curso.curso_profesor.size.should == 3
      end
      it 'when curso is destroyed' do
        3.times{Factory(:curso_profesor, :curso_id => curso.id)}
        curso.destroy
        CursoProfesor.find_by_curso_id(curso.id).should be_nil
      end
    end
    context 'profesores' do
      it 'should return an empty array when no profesores in the curso' do
        curso.profesores.should == []
      end
      it 'should return 3 profesores when 3 profesores related' do
        3.times{curso.profesores << Factory(:profesor)}
        curso.profesores.size.should == 3
      end
    end
  end
end
