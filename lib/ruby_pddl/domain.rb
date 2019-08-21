# frozen_string_literal: true

require 'dry-initializer'

require 'ruby_pddl/types'

module RubyPddl
  # Planning Domain
  class Domain
    include Dry::Initializer.define -> do
      param :name, type: Types::String
    end
  end
end
