require 'rails_helper'

RSpec.describe "local_resources/show", type: :view do
  before(:each) do
    assign(:local_resource, LocalResource.create!(
      name: "Name",
      zip: "Zip",
      website: "Website",
      address: "MyText",
      phone_number: "Phone Number",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
  end
end
