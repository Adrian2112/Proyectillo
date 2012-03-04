require 'spec_helper'

describe Profesor do
  let(:profesor){Factory(:profesor)}
  let(:curso){Factory(:curso)}
  
  describe 'validations' do
    context 'is valid' do
      it 'with all attributes' do
        profesor.should be_valid
      end
      it 'without avatar' do
        profesor.avatar = nil
        profesor.should be_valid
      end
      it 'without apellido materno' do
        profesor.apellido_materno = nil
        profesor.should be_valid
      end
    end
    context 'is not valid' do
      it 'without nombre' do
        profesor.nombre = nil
        profesor.should_not be_valid
      end
      it 'without apellido paterno' do
        profesor.apellido_paterno = nil
        profesor.should_not be_valid
      end
      it 'without campus_id' do
        profesor.campus_id = nil
        profesor.should_not be_valid
      end
      it 'without cursos' do
        profesor.cursos = []
        profesor.should_not be_valid
      end
    end
  end
  describe 'instance methods' do
    context '#to_s' do
      it 'displays the full name' do
        profesor.to_s.should == profesor.nombre_completo
      end
    end
    context '#full_name' do
      it 'displays the full name' do
        profesor.nombre_completo.should == "#{profesor.nombre} #{profesor.apellido_paterno} #{profesor.apellido_materno}".titleize
      end
    end
    context '#promedio' do
      before(:each) do
        3.times do
          3.times do
            cp = Factory(:curso_profesor, :curso_id => curso.id, :profesor_id => profesor.id)
            Factory(:calificacion, :curso_profesor_id => cp.id)
          end
        end
      end
      it 'when no calificaciones' do
        Calificacion.destroy_all
        profesor.promedio.should eql("-")
      end
      it 'when has calificaciones' do
        profesor.promedio.should <= 10.0
        profesor.promedio.should >= 0.0
      end
    end
    context '#nombres_cursos' do
      before(:each) do
        3.times do
          c = Factory(:curso, :campus_id => profesor.campus_id)
          cp = Factory(:curso_profesor, :curso_id => c.id, :profesor_id => profesor.id)
        end
      end
      it 'display the cursos nombres joined by a comma' do
        profesor.nombres_cursos.should == profesor.cursos.map(&:nombre).join(",")
      end
    end
  end
  describe 'associations' do
    it 'has a campus' do
      profesor.campus.should_not be_nil
    end
    it 'should access the university by delegation' do
      profesor.universidad.should_not be_nil
    end
    context 'curso_profesor' do
      it 'without curso profesores' do
        profesor.curso_profesor = []
        profesor.curso_profesor.should == []
      end
      it 'with 3 curso profesores' do
        2.times{Factory(:curso_profesor, :profesor_id => profesor.id)}
        profesor.curso_profesor.size.should == 3
      end
      it 'when curso is destroyed' do
        3.times{Factory(:curso_profesor, :profesor_id => profesor.id)}
        profesor.destroy
        CursoProfesor.find_by_profesor_id(profesor.id).should be_nil
      end
    end
    context 'cursos' do
      it 'should return an empty array when no profesores in the curso' do
        profesor.cursos = []
        profesor.cursos.should be_empty
      end
      it 'should return 3 profesores when 3 profesores related' do
        2.times{profesor.cursos << Factory(:curso)}
        profesor.cursos.size.should == 3
      end
    end
  end
end