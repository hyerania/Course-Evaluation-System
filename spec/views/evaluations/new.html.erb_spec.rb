require 'rails_helper'

RSpec.describe "evaluations/new", type: :view do
  before(:each) do
    assign(:evaluation, Evaluation.new())
  end

  # it "renders new evaluation form" do
  #   render

  #   assert_select "form[action=?][method=?]", evaluations_path, "post" do
  #   end
  # end
end
