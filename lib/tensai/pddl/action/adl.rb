# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types'
require 'tensai/pddl/data_types/conjunction'
require 'tensai/pddl/data_types/variable_list'

module Tensai::Pddl
  module Action
    # ADL action
    class Adl
      extend Dry::Initializer

      param :name, type: DataTypes::Name
      option :parameters, type: DataTypes::VariableList
      option :precondition, type: DataTypes::InstanceOf(Formula::Formula), optional: true
      option :effect, type: DataTypes::InstanceOf(Formula::Formula)

      def initialize(name, **options)
        super name, **options

        check_for_unknown_variables precondition if precondition
        check_for_unknown_variables effect
      end

      private

      def check_for_unknown_variables(formula)
        unknown_variables = formula.variables.reject { |var| parameters.include? var }

        raise ArgumentError, "Unknown variables: #{unknown_variables}" if unknown_variables.any?
      end
    end
  end
end
