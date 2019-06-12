require "abuseipdb/version"
require "abuseipdb/client"

module Abuseipdb
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.client
    @client = Abuseipdb::Client.new(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
