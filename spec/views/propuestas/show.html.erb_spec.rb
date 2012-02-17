require 'spec_helper'

describe "propuestas/show" do
  before(:each) do
    @propuesta = assign(:propuesta, stub_model(Propuesta,
      :titulo => "Titulo",
      :descripcion => "MyText",
      :categoria => "Categoria",
      :comentario_propuesta_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Titulo/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Categoria/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
