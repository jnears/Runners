require 'spec_helper'

describe "relateds/edit" do
  before(:each) do
    @related = assign(:related, stub_model(Related,
      :weburl => "MyText"
    ))
  end

  it "renders the edit related form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", related_path(@related), "post" do
      assert_select "textarea#related_weburl[name=?]", "related[weburl]"
    end
  end
end
