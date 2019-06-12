module Abuseipdb
  class Configuration
    attr_accessor :api_version, :timeout, :api_key

    def initialize(options = nil)
      options = options ? default_options.merge(options) : default_options

      return unless options.is_a?(Hash)

      options.each do |config_name, config_value|
        send("#{config_name}=", config_value)
      end
    end

    private

    def default_options
      {
          api_version: 'v2',
          timeout: 60,
          api_key: nil
      }
    end
  end
end