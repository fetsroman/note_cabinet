require 'rails_helper'

RSpec.describe DocsController, type: :controller do
  let(:user) { create(:user) }
  let(:doc) { create(:doc, user: user) }
  let(:doc_params) { FactoryBot.attributes_for(:doc) }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end

  describe "GET #new" do
    it "responds successfully" do
      get :new
      expect(response).to be_success
    end
  end

  describe "DOC #create" do
    it "saves the new doc in the database" do
      expect{ post :create, params: { doc: doc_params } }.to change(Doc, :count).by(1)
    end

    it "responds successfully" do
      doc
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      get :show, params: { id: doc }
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "responds successfully" do
      get :edit, params: { id: doc, doc: doc_params }
      expect(response).to be_success
    end
  end

  describe "PATCH #update" do
    it "updates a doc" do
      doc_params = FactoryBot.attributes_for(:doc, content: "New content")
      patch :update, params: { id: doc, doc: doc_params }
      expect(doc.reload.content).to eq "New content"
    end
  end

  describe "DELETE #destroy" do
    it "deletes the doc" do
      doc
      expect{ delete :destroy, params: { id: doc } }.to change(Doc, :count).by(-1)
    end

    it "redirects to root#index" do
      delete :destroy, params: { id: doc }
      expect(response).to redirect_to(docs_path)
    end
  end
end