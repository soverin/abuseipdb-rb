require 'abuseipdb/responses/report'

module Abuseipdb
  module Endpoints
    class Report < Base
      PATH = 'report'.freeze

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
        if params[:categories]
          params[:categories] = params[:categories].is_a?(Array) ? params[:categories].join(',') : params[:categories]
        end

        params.select do |key, _value|
          [:ip, :categories].include?(key)
        end
      end
    end
  end
end
