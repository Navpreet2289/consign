require 'rails_helper'

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

RSpec.describe BoroughsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Borough. As you add validations to Borough, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BoroughsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all boroughs as @boroughs" do
      borough = Borough.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:boroughs)).to eq([borough])
    end
  end

  describe "GET show" do
    it "assigns the requested borough as @borough" do
      borough = Borough.create! valid_attributes
      get :show, {:id => borough.to_param}, valid_session
      expect(assigns(:borough)).to eq(borough)
    end
  end

  describe "GET new" do
    it "assigns a new borough as @borough" do
      get :new, {}, valid_session
      expect(assigns(:borough)).to be_a_new(Borough)
    end
  end

  describe "GET edit" do
    it "assigns the requested borough as @borough" do
      borough = Borough.create! valid_attributes
      get :edit, {:id => borough.to_param}, valid_session
      expect(assigns(:borough)).to eq(borough)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Borough" do
        expect {
          post :create, {:borough => valid_attributes}, valid_session
        }.to change(Borough, :count).by(1)
      end

      it "assigns a newly created borough as @borough" do
        post :create, {:borough => valid_attributes}, valid_session
        expect(assigns(:borough)).to be_a(Borough)
        expect(assigns(:borough)).to be_persisted
      end

      it "redirects to the created borough" do
        post :create, {:borough => valid_attributes}, valid_session
        expect(response).to redirect_to(Borough.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved borough as @borough" do
        post :create, {:borough => invalid_attributes}, valid_session
        expect(assigns(:borough)).to be_a_new(Borough)
      end

      it "re-renders the 'new' template" do
        post :create, {:borough => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested borough" do
        borough = Borough.create! valid_attributes
        put :update, {:id => borough.to_param, :borough => new_attributes}, valid_session
        borough.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested borough as @borough" do
        borough = Borough.create! valid_attributes
        put :update, {:id => borough.to_param, :borough => valid_attributes}, valid_session
        expect(assigns(:borough)).to eq(borough)
      end

      it "redirects to the borough" do
        borough = Borough.create! valid_attributes
        put :update, {:id => borough.to_param, :borough => valid_attributes}, valid_session
        expect(response).to redirect_to(borough)
      end
    end

    describe "with invalid params" do
      it "assigns the borough as @borough" do
        borough = Borough.create! valid_attributes
        put :update, {:id => borough.to_param, :borough => invalid_attributes}, valid_session
        expect(assigns(:borough)).to eq(borough)
      end

      it "re-renders the 'edit' template" do
        borough = Borough.create! valid_attributes
        put :update, {:id => borough.to_param, :borough => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested borough" do
      borough = Borough.create! valid_attributes
      expect {
        delete :destroy, {:id => borough.to_param}, valid_session
      }.to change(Borough, :count).by(-1)
    end

    it "redirects to the boroughs list" do
      borough = Borough.create! valid_attributes
      delete :destroy, {:id => borough.to_param}, valid_session
      expect(response).to redirect_to(boroughs_url)
    end
  end

end
