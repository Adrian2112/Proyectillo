require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PropuestasController do

  # This should return the minimal set of attributes required to create a valid
  # Propuesta. As you add validations to Propuesta, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PropuestasController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all propuestas as @propuestas" do
      propuesta = Propuesta.create! valid_attributes
      get :index, {}, valid_session
      assigns(:propuestas).should eq([propuesta])
    end
  end

  describe "GET show" do
    it "assigns the requested propuesta as @propuesta" do
      propuesta = Propuesta.create! valid_attributes
      get :show, {:id => propuesta.to_param}, valid_session
      assigns(:propuesta).should eq(propuesta)
    end
  end

  describe "GET new" do
    it "assigns a new propuesta as @propuesta" do
      get :new, {}, valid_session
      assigns(:propuesta).should be_a_new(Propuesta)
    end
  end

  describe "GET edit" do
    it "assigns the requested propuesta as @propuesta" do
      propuesta = Propuesta.create! valid_attributes
      get :edit, {:id => propuesta.to_param}, valid_session
      assigns(:propuesta).should eq(propuesta)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Propuesta" do
        expect {
          post :create, {:propuesta => valid_attributes}, valid_session
        }.to change(Propuesta, :count).by(1)
      end

      it "assigns a newly created propuesta as @propuesta" do
        post :create, {:propuesta => valid_attributes}, valid_session
        assigns(:propuesta).should be_a(Propuesta)
        assigns(:propuesta).should be_persisted
      end

      it "redirects to the created propuesta" do
        post :create, {:propuesta => valid_attributes}, valid_session
        response.should redirect_to(Propuesta.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved propuesta as @propuesta" do
        # Trigger the behavior that occurs when invalid params are submitted
        Propuesta.any_instance.stub(:save).and_return(false)
        post :create, {:propuesta => {}}, valid_session
        assigns(:propuesta).should be_a_new(Propuesta)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Propuesta.any_instance.stub(:save).and_return(false)
        post :create, {:propuesta => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested propuesta" do
        propuesta = Propuesta.create! valid_attributes
        # Assuming there are no other propuestas in the database, this
        # specifies that the Propuesta created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Propuesta.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => propuesta.to_param, :propuesta => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested propuesta as @propuesta" do
        propuesta = Propuesta.create! valid_attributes
        put :update, {:id => propuesta.to_param, :propuesta => valid_attributes}, valid_session
        assigns(:propuesta).should eq(propuesta)
      end

      it "redirects to the propuesta" do
        propuesta = Propuesta.create! valid_attributes
        put :update, {:id => propuesta.to_param, :propuesta => valid_attributes}, valid_session
        response.should redirect_to(propuesta)
      end
    end

    describe "with invalid params" do
      it "assigns the propuesta as @propuesta" do
        propuesta = Propuesta.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Propuesta.any_instance.stub(:save).and_return(false)
        put :update, {:id => propuesta.to_param, :propuesta => {}}, valid_session
        assigns(:propuesta).should eq(propuesta)
      end

      it "re-renders the 'edit' template" do
        propuesta = Propuesta.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Propuesta.any_instance.stub(:save).and_return(false)
        put :update, {:id => propuesta.to_param, :propuesta => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested propuesta" do
      propuesta = Propuesta.create! valid_attributes
      expect {
        delete :destroy, {:id => propuesta.to_param}, valid_session
      }.to change(Propuesta, :count).by(-1)
    end

    it "redirects to the propuestas list" do
      propuesta = Propuesta.create! valid_attributes
      delete :destroy, {:id => propuesta.to_param}, valid_session
      response.should redirect_to(propuestas_url)
    end
  end

end