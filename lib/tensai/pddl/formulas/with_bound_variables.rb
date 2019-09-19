# frozen_string_literal: true

require 'dry-equalizer'
require 'dry-initializer'

module Tensai::Pddl
  module Formulas
    # Formula with bound variables
    class WithBoundVariables < Formula
      include Dry::Equalizer(:variables, :formula)
      extend Dry::Initializer

      param :variables, type: DataTypes::VariableList
      param :formula, type: DataTypes::InstanceOf(Formula)

      def initialize(variables, formula)
        super variables, formula

        check_bound_variables_used
      end

      def free_variables
        formula.free_variables.reject { |v| variables.include? v }
      end

      private

      def check_bound_variables_used
        unused_bound_variables = variables.reject { |v| formula.free_variables.include? v }

        raise ArgumentError, "Unused bound variables #{unused_bound_variables}" if unused_bound_variables.any?
      end
    end
  end
end
