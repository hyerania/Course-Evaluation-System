require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe "POST #delete" do
     it "returns http success" do
      post :delete
      expect(response).to have_http_status(302)
     end
  end

end
