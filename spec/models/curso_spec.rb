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
  
  describe 'Validations' do
    context 'is valid' do
      it 'with all attributes' do
        curso.should be_valid
      end
    end
  end

end
