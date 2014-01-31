require 'spec_helper'

describe "intranets/edit" do
  before(:each) do
    @intranet = assign(:intranet, stub_model(Intranet,
      :category_name => "MyText",
      :show => false
    ))
  end

  it "renders the edit intranet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", intranet_path(@intranet), "post" do
      assert_select "textarea#intranet_category_name[name=?]", "intranet[category_name]"
      assert_select "input#intranet_show[name=?]", "intranet[show]"
    end
  end
end
