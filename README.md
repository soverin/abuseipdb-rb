# Abuseipdb::Rb

[![Gem Version](https://badge.fury.io/rb/abuseipdb-rb.svg)](https://badge.fury.io/rb/abuseipdb-rb)
[![Build Status](https://travis-ci.org/falegk/abuseipdb-rb.svg?branch=master)](https://travis-ci.org/falegk/abuseipdb-rb)

A Ruby client gem for the [AbuseIPDB](https://www.abuseipdb.com) service API

| Branch | AbuseIPDB API |
| ------ | ------ |
| _Master_ | [v2](https://docs.abuseipdb.com/#introduction) |


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'abuseipdb-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install abuseipdb-rb

## Usage

First set up configurations (Ex. for rails apps into config/initializers)

```ruby
Abuseipdb.configure do |config|
    config.api_key = "YOUR_ABUSEIPDB_API_KEY"
    config.timeout = 20 # Default is 60s
end
```

Then just init a client an use it

```ruby
client = Abuseipdb.client

# CHECK Endpoint
response = client.check.call(ipAddress: '8.8.8.8')

response.status
    => 200
response.body
    => {"data"=>{"ipAddress"=>"8.8.8.8", "isPublic"=>true, 
        "ipVersion"=>4, "isWhitelisted"=>true, "abuseConfidenceScore"=>0, 
        "countryCode"=>"US", "usageType"=>"Data Center/Web Hosting/Transit", 
        "isp"=>"Google LLC", "domain"=>"google.com", "totalReports"=>16, 
        "lastReportedAt"=>"2019-06-12T01:09:53+01:00"}}

```

## Current Endpoints

| Command | Endpoint |
| ------ | ------ |
| client = Abuseipdb.client | Init a client |
| client.check.call | https://api.abuseipdb.com/api/v2/check |
| client.blacklist.call | https://api.abuseipdb.com/api/v2/blacklist |
| client.check_block.call | https://api.abuseipdb.com/api/v2/check-block |



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

[Report issues / feature requests](https://github.com/falegk/abuseipdb-rb/issues) and [pull requests](https://github.com/falegk/abuseipdb-rb/pulls) are welcome.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
