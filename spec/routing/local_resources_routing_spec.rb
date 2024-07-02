require "rails_helper"

RSpec.describe LocalResourcesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/local_resources").to route_to("local_resources#index")
    end

    it "routes to #new" do
      expect(get: "/local_resources/new").to route_to("local_resources#new")
    end

    it "routes to #show" do
      expect(get: "/local_resources/1").to route_to("local_resources#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/local_resources/1/edit").to route_to("local_resources#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/local_resources").to route_to("local_resources#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/local_resources/1").to route_to("local_resources#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/local_resources/1").to route_to("local_resources#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/local_resources/1").to route_to("local_resources#destroy", id: "1")
    end
  end
end
