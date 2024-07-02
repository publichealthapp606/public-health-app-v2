require 'rails_helper'

RSpec.describe "local_resources/edit", type: :view do
  let(:local_resource) {
    LocalResource.create!(
      name: "MyString",
      zip: "MyString",
      website: "MyString",
      address: "MyText",
      phone_number: "MyString",
      email: "MyString"
    )
  }

  before(:each) do
    assign(:local_resource, local_resource)
  end

  it "renders the edit local_resource form" do
    render

    assert_select "form[action=?][method=?]", local_resource_path(local_resource), "post" do

      assert_select "input[name=?]", "local_resource[name]"

      assert_select "input[name=?]", "local_resource[zip]"

      assert_select "input[name=?]", "local_resource[website]"

      assert_select "textarea[name=?]", "local_resource[address]"

      assert_select "input[name=?]", "local_resource[phone_number]"

      assert_select "input[name=?]", "local_resource[email]"
    end
  end
end
