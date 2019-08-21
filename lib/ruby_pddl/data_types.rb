# frozen_string_literal: true

require 'dry-types'

require 'ruby_pddl/data_types/base'
require 'ruby_pddl/data_structures'

# rubocop:disable Naming/MethodName
module RubyPddl
  # Types for argument validations
  module DataTypes
    Name = Base::String
           .constrained(format: /^[a-z][a-z\d\-_]*$/)
           .constructor(&:to_s)

    module_function

    def ListOf(type)
      Base::Instance(NamedList)
          .constructor(->(elements) { NamedList.new(type).concat(elements) })
    end
  end
end
# rubocop:enable Naming/MethodName
