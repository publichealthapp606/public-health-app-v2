require 'rails_helper'

RSpec.describe "local_resources/new", type: :view do
  before(:each) do
    assign(:local_resource, LocalResource.new(
      name: "MyString",
      zip: "MyString",
      website: "MyString",
      address: "MyText",
      phone_number: "MyString",
      email: "MyString"
    ))
  end

  it "renders new local_resource form" do
    render

    assert_select "form[action=?][method=?]", local_resources_path, "post" do

      assert_select "input[name=?]", "local_resource[name]"

      assert_select "input[name=?]", "local_resource[zip]"

      assert_select "input[name=?]", "local_resource[website]"

      assert_select "textarea[name=?]", "local_resource[address]"

      assert_select "input[name=?]", "local_resource[phone_number]"

      assert_select "input[name=?]", "local_resource[email]"
    end
  end
end
