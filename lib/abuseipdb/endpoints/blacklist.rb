require 'abuseipdb/responses/blacklist'

module Abuseipdb
  module Endpoints
    class Blacklist < Base
      PATH = 'blacklist'.freeze

      def url_path
        PATH
      end

      # params https://docs.abuseipdb.com/#blacklist-parameters
      def call(params = {})
        params = default_params(params)
        response = @api.get(url_path, params)
        Abuseipdb::Responses::Blacklist.new(response)
      end

      private

      def default_params(params)
        params.select do |key, _value| [:countMinimum, :maxAgeInDays, :confidenceMinimum,
                                        :limit, :plaintext, :self].include?(key)
        end
      end
    end
  end
end
