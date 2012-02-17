require 'spec_helper'

describe "propuestas/index" do
  before(:each) do
    assign(:propuestas, [
      stub_model(Propuesta,
        :titulo => "Titulo",
        :descripcion => "MyText",
        :categoria => "Categoria",
        :comentario_propuesta_id => 1
      ),
      stub_model(Propuesta,
        :titulo => "Titulo",
        :descripcion => "MyText",
        :categoria => "Categoria",
        :comentario_propuesta_id => 1
      )
    ])
  end

  it "renders a list of propuestas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Categoria".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
