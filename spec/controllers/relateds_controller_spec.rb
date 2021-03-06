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

describe RelatedsController do

  # This should return the minimal set of attributes required to create a valid
  # Related. As you add validations to Related, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "weburl" => "MyText" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RelatedsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all relateds as @relateds" do
      related = Related.create! valid_attributes
      get :index, {}, valid_session
      assigns(:relateds).should eq([related])
    end
  end

  describe "GET show" do
    it "assigns the requested related as @related" do
      related = Related.create! valid_attributes
      get :show, {:id => related.to_param}, valid_session
      assigns(:related).should eq(related)
    end
  end

  describe "GET new" do
    it "assigns a new related as @related" do
      get :new, {}, valid_session
      assigns(:related).should be_a_new(Related)
    end
  end

  describe "GET edit" do
    it "assigns the requested related as @related" do
      related = Related.create! valid_attributes
      get :edit, {:id => related.to_param}, valid_session
      assigns(:related).should eq(related)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Related" do
        expect {
          post :create, {:related => valid_attributes}, valid_session
        }.to change(Related, :count).by(1)
      end

      it "assigns a newly created related as @related" do
        post :create, {:related => valid_attributes}, valid_session
        assigns(:related).should be_a(Related)
        assigns(:related).should be_persisted
      end

      it "redirects to the created related" do
        post :create, {:related => valid_attributes}, valid_session
        response.should redirect_to(Related.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved related as @related" do
        # Trigger the behavior that occurs when invalid params are submitted
        Related.any_instance.stub(:save).and_return(false)
        post :create, {:related => { "weburl" => "invalid value" }}, valid_session
        assigns(:related).should be_a_new(Related)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Related.any_instance.stub(:save).and_return(false)
        post :create, {:related => { "weburl" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested related" do
        related = Related.create! valid_attributes
        # Assuming there are no other relateds in the database, this
        # specifies that the Related created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Related.any_instance.should_receive(:update).with({ "weburl" => "MyText" })
        put :update, {:id => related.to_param, :related => { "weburl" => "MyText" }}, valid_session
      end

      it "assigns the requested related as @related" do
        related = Related.create! valid_attributes
        put :update, {:id => related.to_param, :related => valid_attributes}, valid_session
        assigns(:related).should eq(related)
      end

      it "redirects to the related" do
        related = Related.create! valid_attributes
        put :update, {:id => related.to_param, :related => valid_attributes}, valid_session
        response.should redirect_to(related)
      end
    end

    describe "with invalid params" do
      it "assigns the related as @related" do
        related = Related.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Related.any_instance.stub(:save).and_return(false)
        put :update, {:id => related.to_param, :related => { "weburl" => "invalid value" }}, valid_session
        assigns(:related).should eq(related)
      end

      it "re-renders the 'edit' template" do
        related = Related.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Related.any_instance.stub(:save).and_return(false)
        put :update, {:id => related.to_param, :related => { "weburl" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested related" do
      related = Related.create! valid_attributes
      expect {
        delete :destroy, {:id => related.to_param}, valid_session
      }.to change(Related, :count).by(-1)
    end

    it "redirects to the relateds list" do
      related = Related.create! valid_attributes
      delete :destroy, {:id => related.to_param}, valid_session
      response.should redirect_to(relateds_url)
    end
  end

end
