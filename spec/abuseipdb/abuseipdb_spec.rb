require 'spec_helper'

RSpec.describe Abuseipdb do
  before :all do
    Abuseipdb.configure do |config|
      config.timeout = 20
      config.api_key = API_KEY
    end
  end

  it "has a version number" do
    expect(Abuseipdb::VERSION).not_to be nil
  end

  describe 'Init Client' do
    subject { Abuseipdb.client }

    it { is_expected.to be_a Abuseipdb::Client }
    it('has endpoints as methods') { expect(subject.methods).to include(*Abuseipdb::Client::ENDPOINTS) }
  end

  describe "#configure" do
    subject(:client) { Abuseipdb.client }

    it("return configure timeout") { expect(client.configuration.timeout).to eq(20) }
    it("return configure timeout") { expect(client.configuration.api_key).to eq('API_KEY_1') }
  end
end
