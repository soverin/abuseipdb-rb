require 'faraday'
# require 'faraday_middleware'

require 'abuseipdb/configuration'
require 'abuseipdb/endpoints/base'
require 'abuseipdb/endpoints/check'
require 'abuseipdb/endpoints/blacklist'
require 'abuseipdb/endpoints/check_block'
require 'abuseipdb/endpoints/report'

module Abuseipdb
  class Client

    ENDPOINTS = %i[check blacklist check_block report].freeze

    attr_reader :configuration

    attr_accessor *ENDPOINTS

    # options
    #   api_key Your API key
    #   api_version default v2
    #   timeout default 60 (seconds)
    def initialize(configuration = Configuration.new)
      @configuration = configuration
      define_endpoint_methods
    end

    def api_connection(url = nil)
      url ||= "https://api.abuseipdb.com/api/#{@configuration.api_version}/"

      Faraday.new(url: url) do |faraday|
        faraday.response :logger
        faraday.request :json
        faraday.ssl.verify = false
        faraday.headers['Accept'] = 'application/json'
        faraday.options.timeout = @configuration.timeout # open/read timeout in seconds
        faraday.adapter Faraday.default_adapter

        if @configuration.api_key
          # faraday.set_authorization_header :Key, @configuration.api_key
          faraday.headers['Key'] = @configuration.api_key
        end
      end
    end

    private

    def define_endpoint_methods
      namespace = "Abuseipdb::Endpoints"

      ENDPOINTS.each do |endpoint|
        begin
          endpoint_klass = Object.const_get("#{namespace}::#{endpoint.to_s.split('_').collect(&:capitalize).join}")
          klass = endpoint_klass.new(self)
          send("#{endpoint.to_s}=", klass)
        rescue NameError => _ex
          next
        end
      end
    end
  end
end
