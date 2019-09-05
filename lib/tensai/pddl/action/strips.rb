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
      include Dry::Initializer.define -> do
        param :name, type: DataTypes::Name
        option :parameters, type: DataTypes::VariableList
        option :precondition, type: DataTypes::InstanceOf(Formula::Formula), optional: true
      end

      def initialize(name, **options)
        super name, **options
        validate_precondition if precondition
      end

      private

      def validate_precondition
        DataTypes::PositiveConjunction[precondition]
      end
    end
  end
end
