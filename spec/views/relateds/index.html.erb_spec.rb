require 'spec_helper'

describe "relateds/index" do
  before(:each) do
    assign(:relateds, [
      stub_model(Related,
        :weburl => "MyText"
      ),
      stub_model(Related,
        :weburl => "MyText"
      )
    ])
  end

  it "renders a list of relateds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
