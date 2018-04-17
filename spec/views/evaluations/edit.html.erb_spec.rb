require 'rails_helper'

RSpec.describe "evaluations/edit", type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, Evaluation.create!())
  end

  # it "renders the edit evaluation form" do
  #   render

  #   assert_select "form[action=?][method=?]", evaluation_path(@evaluation), "post" do
  #   end
  # end
end
