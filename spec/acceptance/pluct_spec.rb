require 'spec_helper'

describe Pluct, :acceptance do
  
    it '', :vcr, cassette_name: 'acceptance/pluct_resource' do
    resource = Pluct.get_resource 'http://repos.example.com/interatividade/famosos'
    resource_self = MultiJson.decode(resource.self)

    expect(resource_self).to have_key("items")
    expect(resource_self.item_count).to eq 2
  end
end