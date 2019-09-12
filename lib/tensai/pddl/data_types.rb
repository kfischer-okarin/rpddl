# frozen_string_literal: true

require 'set'

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
      Base::Instance(type)
    end

    def FilledSetOf(type)
      Base::Constructor(Set)
          .constrained(filled: true)
          .constrained(fulfills: ->(elements) { elements.all? { |e| e.is_a? type } })
    end
  end
end
# rubocop:enable Naming/MethodName

Dry::Logic::Predicates.predicate('fulfills?') do |condition, input|
  condition.call(input)
end
