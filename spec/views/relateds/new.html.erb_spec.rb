require 'spec_helper'

describe "relateds/new" do
  before(:each) do
    assign(:related, stub_model(Related,
      :weburl => "MyText"
    ).as_new_record)
  end

  it "renders new related form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", relateds_path, "post" do
      assert_select "textarea#related_weburl[name=?]", "related[weburl]"
    end
  end
end
