# frozen_string_literal: true

require 'dry-types'

module RubyPddl
  # Types for argument validations
  module Types
    # Base Types from dry-types
    module Base
      include Dry.Types()
    end

    Name = Base::String
           .constrained(format: /^[a-z][a-z\d\-_]*$/)
           .constructor(&:to_s)
  end
end
