require 'abuseipdb/responses/check_block'

module Abuseipdb
  module Endpoints
    class CheckBlock < Base
      PATH = 'check-block'.freeze

      def url_path
        PATH
      end

      # params https://docs.abuseipdb.com/#check-block-endpoint
      def call(params = {})
        params = default_params(params)
        response = @api.get(url_path, params)
        Abuseipdb::Responses::CheckBlock.new(response)
      end

      private

      def default_params(params)
        params.select do |key, _value| [:network, :maxAgeInDays].include?(key)
        end
      end
    end
  end
end
