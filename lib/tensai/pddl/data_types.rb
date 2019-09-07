# frozen_string_literal: true

require 'tensai/pddl/data_types/base'

# rubocop:disable Naming/MethodName
module Tensai::Pddl
  # Types for argument validations
  module DataTypes
    Name = Base::String
           .constrained(format: /^[a-z][a-z\d\-_]*$/)
           .constructor(&:to_s)

    module_function

    def InstanceOf(type)
      Base::Instance(type).constructor(->(instance) {
        if block_given?
          Base::Instance(type)[instance]
          yield instance
        end
        instance
      })
    end

    def FilledArrayOf(type)
      Base::Array.of(InstanceOf(type))
                 .constrained(filled: true)
    end
  end
end
# rubocop:enable Naming/MethodName
