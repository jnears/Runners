require 'spec_helper'

describe "runners/new" do
  before(:each) do
    assign(:runner, stub_model(Runner,
      :firstname => "MyString",
      :lastname => "MyString"
    ).as_new_record)
  end

  it "renders new runner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", runners_path, "post" do
      assert_select "input#runner_firstname[name=?]", "runner[firstname]"
      assert_select "input#runner_lastname[name=?]", "runner[lastname]"
    end
  end
end
