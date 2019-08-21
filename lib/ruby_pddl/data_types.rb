# frozen_string_literal: true

require 'dry-types'

# rubocop:disable Naming/MethodName
module RubyPddl
  # Types for argument validations
  module DataTypes
    # Base Types from dry-types
    module Base
      include Dry.Types()
    end

    Name = Base::String
           .constrained(format: /^[a-z][a-z\d\-_]*$/)
           .constructor(&:to_s)

    module_function

    def ListOf(type)
      Base::Array.of(Base::Instance(type))
    end
  end
end
# rubocop:enable Naming/MethodName
