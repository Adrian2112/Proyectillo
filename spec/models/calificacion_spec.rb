require 'spec_helper'

describe Calificacion do
  let(:calificacion){Factory(:calificacion)}
  let(:usuario){Factory(:usuario)}
  
  describe 'Validations' do
    context 'is valid' do
      it 'with all attributes' do
        calificacion.should be_valid
      end
    end
    context 'is not valid' do
      it 'when puntualidad is not a number' do
        calificacion.puntualidad = "ocho"
        calificacion.should_not be_valid
      end
      it 'when amigable is not a number' do
        calificacion.amigable = "ocho"
        calificacion.should_not be_valid
      end
      it 'when conocimiento is not a number' do
        calificacion.conocimiento = "ocho"
        calificacion.should_not be_valid
      end
      it 'when claridad is not a number' do
        calificacion.claridad = "ocho"
        calificacion.should_not be_valid
      end
      it 'when flexibilidad is not a number' do
        calificacion.flexibilidad = "ocho"
        calificacion.should_not be_valid
      end
      it 'when facilidad is not a number' do
        calificacion.facilidad = "ocho"
        calificacion.should_not be_valid
      end
      it 'when calificacion obtenida is not a number' do
        calificacion.calificacion_obtenida = "blah"
        calificacion.should_not be_valid
      end
      it 'when puntualidad is not between 0 and 10' do
        calificacion.puntualidad = 12
        calificacion.should_not be_valid
        calificacion.puntualidad = -1
        calificacion.should_not be_valid
      end
      it 'when amigable is not between 0 and 10' do
        calificacion.amigable = 12
        calificacion.should_not be_valid
        calificacion.amigable = -1
        calificacion.should_not be_valid
      end
      it 'when conocimiento is not between 0 and 10' do
        calificacion.conocimiento = 12
        calificacion.should_not be_valid
        calificacion.conocimiento = -1
        calificacion.should_not be_valid
      end
      it 'when claridad is not between 0 and 10' do
        calificacion.claridad = 12
        calificacion.should_not be_valid
        calificacion.claridad = -1
        calificacion.should_not be_valid
      end
      it 'when flexibilidad is not between 0 and 10' do
        calificacion.flexibilidad = 12
        calificacion.should_not be_valid
        calificacion.flexibilidad = -1
        calificacion.should_not be_valid
      end
      it 'when facilidad is not between 0 and 10' do
        calificacion.facilidad = 12
        calificacion.should_not be_valid
        calificacion.facilidad = -1
        calificacion.should_not be_valid
      end
      it 'when calificacion is not between 0 and 100' do
        calificacion.calificacion_obtenida = 200
        calificacion.should_not be_valid
        calificacion.calificacion_obtenida = -1
        calificacion.should_not be_valid
      end
    end
  end
  describe 'Instance methods' do

  end
end