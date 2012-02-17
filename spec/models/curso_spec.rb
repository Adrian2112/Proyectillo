require 'spec_helper'

describe Curso do
  let(:curso) {Factory(:curso)}
  
  describe 'Validations' do
    context 'is valid' do
      it 'with all attributes' do
        curso.should be_valid
      end
    end
  end

end