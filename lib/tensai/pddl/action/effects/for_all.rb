# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types/variable_list'

module Tensai::Pddl
  module Action
    module Effects
      # Effect that is applied on all entities that can be assigned to the bound variables
      class ForAll < Effect
        include Dry::Initializer.define -> do
          param :variables, type: DataTypes::VariableList
          param :effect, type: DataTypes::InstanceOf(Effect)
        end

        def initialize(variables, effect)
          super variables, effect

          check_bound_variables_used
        end

        def free_variables
          effect.free_variables.reject { |v| variables.include? v }
        end

        private

        def check_bound_variables_used
          unused_bound_variables = variables.reject { |v| effect.free_variables.include? v }

          raise ArgumentError, "Unused bound variables #{unused_bound_variables}" if unused_bound_variables.any?
        end
      end
    end
  end
end
