require 'abuseipdb/responses/report'

module Abuseipdb
  module Endpoints
    class Report < Base
      PATH = 'report'

      def url_path
        PATH
      end

      # params https://docs.abuseipdb.com/#report
      def call(params = {})
        params = default_params(params)
        response = @api.post(url_path, params)
        Abuseipdb::Responses::Report.new(response)
      end

      private

      def default_params(params)
        params[:categories] = params[:categories].join(',')
        params.select do |key, _value| [:ip, :categories].include?(key)
        end
      end
    end
  end
end
