lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'garage_client/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "garage_client-rails"
  spec.version       = GarageClient::Rails::VERSION
  spec.authors       = ["Takatoshi Maeda"]
  spec.email         = ["me@tmd.tw"]

  spec.summary       = %q{GarageClient for rails}
  spec.description   = %q{garage_client-rails is a garage application api client for rails}
  spec.homepage      = "https://github.com/TakatoshiMaeda/garage_client-rails"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "garage_client"
  spec.add_dependency "rails", '>= 4.0.0'

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
