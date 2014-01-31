require 'spec_helper'

describe "intranets/show" do
  before(:each) do
    @intranet = assign(:intranet, stub_model(Intranet,
      :category_name => "MyText",
      :show => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
