require 'spec_helper'

describe "propuestas/new" do
  before(:each) do
    assign(:propuesta, stub_model(Propuesta,
      :titulo => "MyString",
      :descripcion => "MyText",
      :categoria => "MyString",
      :comentario_propuesta_id => 1
    ).as_new_record)
  end

  it "renders new propuesta form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => propuestas_path, :method => "post" do
      assert_select "input#propuesta_titulo", :name => "propuesta[titulo]"
      assert_select "textarea#propuesta_descripcion", :name => "propuesta[descripcion]"
      assert_select "input#propuesta_categoria", :name => "propuesta[categoria]"
      assert_select "input#propuesta_comentario_propuesta_id", :name => "propuesta[comentario_propuesta_id]"
    end
  end
end
