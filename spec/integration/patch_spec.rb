require "spec_helper"

describe "following a link with PATCH method", :vcr, cassette_name: "integration/patch" do
  it "should PATCH resource" do
    root = Pluct::Resource.new("http://localhost:8888")
    resource = root.rel_collection({
      context_name: "pluct",
      collection_name: "people"
    }).rel_add({name: "Alice"})

    expect(resource.response.code).to eq(201)

    location = Addressable::URI.parse(resource.response.headers[:location])
    resource_id = location.path.split("/")[3]

    root = Pluct::Resource.new("http://localhost:8888")
    resource = root.rel_resource({
      context_name: "pluct",
      collection_name: "people",
      resource_id: resource_id
    }).rel_update({name: "Alice PATCH"})

    expect(resource.response.code).to eq(204)

    resource = root.rel_resource({
      context_name: "pluct",
      collection_name: "people",
      resource_id: resource_id
    })

    expect(resource.data[:name]).to eq("Alice PATCH")
  end
end
