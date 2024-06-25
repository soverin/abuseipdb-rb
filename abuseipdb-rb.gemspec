lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "abuseipdb/version"

Gem::Specification.new do |spec|
  spec.name          = "abuseipdb-rb"
  spec.version       = Abuseipdb::VERSION
  spec.authors       = ["Antony Falegkos"]
  spec.email         = ["afalegk@gmail.com"]
  spec.licenses      = ['MIT']
  spec.summary       = %q{A Ruby client gem for [AbuseIPDB](https://www.abuseipdb.com) service API}
  spec.description   = %q{AbuseIPDB is a project dedicated to helping combat the spread of hackers, spammers, and abusive activity on the internet.}
  spec.homepage      = "https://github.com/falegk/abuseipdb-rb"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = "https://github.com/falegk/abuseipdb-rb/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0", ">= 1.16"
  spec.add_development_dependency "rake", '~> 12.3', ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", '~> 4.0', '>= 4.0.0'

  spec.add_runtime_dependency 'faraday', '>= 2.9'
end
