require 'abuseipdb/responses/check'

module Abuseipdb
  module Endpoints
    class Check < Base
      PATH = 'check'.freeze

      def url_path
        PATH
      end

      # params https://docs.abuseipdb.com/#check-endpoint
      def call(params = {})
        params = default_params(params)
        response = @api.get(url_path, params)
        Abuseipdb::Responses::Check.new(response)
      end

      private

      def default_params(params)
        params.select { |key, _value| [:ipAddress, :maxAgeInDays, :verbose].include?(key) }
      end
    end
  end
end
