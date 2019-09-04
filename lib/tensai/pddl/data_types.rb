# frozen_string_literal: true

require 'dry-types'

require 'tensai/pddl/data_types/base'
require 'tensai/pddl/data_structures'

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

    def NamedListOf(type)
      InstanceOf(NamedList)
        .constructor(->(elements) { NamedList.new(type, elements) })
    end
  end
end
# rubocop:enable Naming/MethodName
