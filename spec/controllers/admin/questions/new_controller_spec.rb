require 'rails_helper'

RSpec.describe Admin::Questions::NewController, type: :controller do

  describe "GET #c2" do
    it "returns http success" do
      get :c2
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #c3" do
    it "returns http success" do
      get :c3
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #c4" do
    it "returns http success" do
      get :c4
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #c5" do
    it "returns http success" do
      get :c5
      expect(response).to have_http_status(:success)
    end
  end

end
