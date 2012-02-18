require 'spec_helper'

describe Autenticacion do
  let(:autenticacion){Factory(:autenticacion)}
  describe 'Validations' do
    context 'autenticacion is valid' do
      it 'with all attributes' do
        autenticacion.should be_valid
      end
    end
  end
  describe 'autenticacion provider' do
    it 'with a twitter provider' do
      twitter = Factory(:twitter)
      twitter.provedor.should == "Twitter"
    end
    it 'with facebook provider' do
      facebook = Factory(:facebook)
      facebook.provedor.should == "Facebook"
    end
  end
end