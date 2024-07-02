require 'rails_helper'

RSpec.describe "local_resources/index", type: :view do
  before(:each) do
    assign(:local_resources, [
      LocalResource.create!(
        name: "Name",
        zip: "Zip",
        website: "Website",
        address: "MyText",
        phone_number: "Phone Number",
        email: "Email"
      ),
      LocalResource.create!(
        name: "Name",
        zip: "Zip",
        website: "Website",
        address: "MyText",
        phone_number: "Phone Number",
        email: "Email"
      )
    ])
  end

  it "renders a list of local_resources" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Zip".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Website".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
  end
end
