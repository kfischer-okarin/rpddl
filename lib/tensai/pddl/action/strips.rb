# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/formula'
require 'tensai/pddl/data_types'
require 'tensai/pddl/data_types/positive_conjunction'
require 'tensai/pddl/data_types/variable_list'
require 'tensai/pddl/variable'

module Tensai::Pddl
  module Action
    # STRIPS-style action
    class Strips
      extend Dry::Initializer

      param :name, type: DataTypes::Name
      option :parameters, type: DataTypes::VariableList
      option :precondition, type: DataTypes::PositiveConjunction, optional: true

      def initialize(name, **options)
        super name, **options

        check_for_unknown_variables precondition if precondition
      end

      private

      def check_for_unknown_variables(formula)
        unknown_variables = formula.variables.reject { |var| parameters.include? var }

        raise ArgumentError, "Unknown variables: #{unknown_variables}" if unknown_variables.any?
      end
    end
  end
end
