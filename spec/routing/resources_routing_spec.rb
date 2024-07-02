require "rails_helper"

RSpec.describe ResourcesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/resources").to route_to("resources#index")
    end

  end
end
