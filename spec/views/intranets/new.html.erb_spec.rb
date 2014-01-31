require 'spec_helper'

describe "intranets/new" do
  before(:each) do
    assign(:intranet, stub_model(Intranet,
      :category_name => "MyText",
      :show => false
    ).as_new_record)
  end

  it "renders new intranet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", intranets_path, "post" do
      assert_select "textarea#intranet_category_name[name=?]", "intranet[category_name]"
      assert_select "input#intranet_show[name=?]", "intranet[show]"
    end
  end
end
