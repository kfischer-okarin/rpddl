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
      option :precondition, type: DataTypes::InstanceOf(Formula), optional: true
      option :effects, type: DataTypes::FilledSetOf(Effect)

      def initialize(name, **options)
        super name, **options

        check_for_unknown_variables precondition if precondition
        effects.each { |e| check_for_unknown_variables e }
      end

      private

      def check_for_unknown_variables(formula)
        unknown_variables = formula.free_variables.reject { |var| parameters.include? var }

        raise ArgumentError, "Unknown variables: #{unknown_variables}" if unknown_variables.any?
      end
    end
  end
end
