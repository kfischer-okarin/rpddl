# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_pddl/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby_pddl'
  spec.version       = RubyPddl::VERSION
  spec.authors       = ['Kevin Fischer']
  spec.email         = ['kfischer_okarin@yahoo.co.jp']

  spec.summary       = 'Ruby implementation and DSL for PDDL (Planning Domain Definition Language)'
  spec.homepage      = 'https://github.com/kfischer-okarin/ruby_pddl'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/kfischer-okarin/ruby_pddl'
    # spec.metadata['changelog_uri'] = 'https://github.com/kfischer-okarin/ruby_pddl/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
