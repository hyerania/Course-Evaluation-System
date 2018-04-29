require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
    describe "POST #goback" do
        before(:each) do
            #visit "/"
            #fill_in :uin, with: 123000123
            #find('submit_tag "Login"').click
            #session[:uin]=123000213
        end
        it "trigger goback" do
            @student=Student.all.first
            @evaluation=["What is the color of the blood2?"]
            
            get :view, :params => {:page => "2",:stat => "noanswer",:commit => "Next"}
            expect(response).to have_http_status(302)
        end
    end
end
