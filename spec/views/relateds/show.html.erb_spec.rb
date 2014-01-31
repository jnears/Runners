require 'spec_helper'

describe "relateds/show" do
  before(:each) do
    @related = assign(:related, stub_model(Related,
      :weburl => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
