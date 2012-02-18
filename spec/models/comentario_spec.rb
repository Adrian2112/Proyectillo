# == Schema Information
#
# Table name: comentarios
#
#  id              :integer(4)      not null, primary key
#  comentario      :text
#  usuario_id      :integer(4)
#  calificacion_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe Comentario do
  let(:comentario) {Factory(:comentario)}
  
  describe 'Validations' do
    context 'is valid' do
      it 'with all the attributes' do
        comentario.should be_valid
      end
      it 'without comentario' do
        comentario.comentario = nil
        comentario.should be_valid
      end
    end
  end
  
  describe 'relations' do
    context 'usuario' do
      it 'should return a user related to the comment' do
        comentario.usuario.should_not be_nil
      end
    end
    
    context 'calificacion' do
      it 'should return a califiacion related to the comment' do
        comentario.calificacion.should_not be_nil
      end
    end
  end

end
