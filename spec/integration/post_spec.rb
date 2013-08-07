require "spec_helper"

describe "following a link with POST method", :vcr, cassette_name: "integration/post" do
  it "should POST resource" do
    root = Pluct::Resource.new("http://localhost:8888")
    resource = root.collection({
      context_name: "pluct",
      collection_name: "people"
    }).add({name: "Alice"})

    expect(resource.response.code).to eq(201)

    location = Addressable::URI.parse(resource.response.headers[:location])
    resource_id = location.path.split("/")[3]

    resource = root.resource({
      context_name: "pluct",
      collection_name: "people",
      resource_id: resource_id
    })

    expect(resource.data[:name]).to eq("Alice")
  end
end