require 'spec_helper'

describe "intranets/index" do
  before(:each) do
    assign(:intranets, [
      stub_model(Intranet,
        :category_name => "MyText",
        :show => false
      ),
      stub_model(Intranet,
        :category_name => "MyText",
        :show => false
      )
    ])
  end

  it "renders a list of intranets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
