require 'spec_helper'

describe "runners/edit" do
  before(:each) do
    @runner = assign(:runner, stub_model(Runner,
      :firstname => "MyString",
      :lastname => "MyString"
    ))
  end

  it "renders the edit runner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", runner_path(@runner), "post" do
      assert_select "input#runner_firstname[name=?]", "runner[firstname]"
      assert_select "input#runner_lastname[name=?]", "runner[lastname]"
    end
  end
end
