require 'spec_helper'

RSpec.describe Abuseipdb::Endpoints::Check do
  before :all do
    Abuseipdb.configure do |config|
      config.timeout = 20
      config.api_key = 'API_KEY_1'
    end
  end

  let(:params) { { ipAddress: "8.8.8.8" } }
  let(:client) { Abuseipdb.client }

  subject(:check) { client.check }

  context '#call' do
    let(:response) do
      VCR.use_cassette('check', record: :new_episodes) do
        check.call(params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'data exist' do
      expect(response.body).to have_key('data')
    end

    it 'correct ipAddress' do
      expect(response.body['data']['ipAddress']).to eq params[:ipAddress]
    end
  end
end