# Pluct

WIP

## Installation

Add this line to your application's Gemfile:

    gem 'pluct'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pluct

## Usage

```ruby
    require 'pluct'
    resource = Pluct.get_resource 'http://repos.plataformas.glb.com/interatividade/famosos'
    resource.schema
    resource.schema.data
    resource.data
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
