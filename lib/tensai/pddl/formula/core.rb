# frozen_string_literal: true

require 'dry-equalizer'
require 'dry-initializer'

require 'tensai/pddl/data_types/variable_list'

module Tensai::Pddl
  module Formula
    # Formula
    class Formula
      def and(other)
        return other.and self if other.is_a? And

        And.new(self, other)
      end

      def or(other)
        return other.or self if other.is_a? Or

        Or.new(self, other)
      end

      def not
        Negated.new self
      end

      def implies(other)
        self.not.or other
      end

      private

      def initialize; end
    end

    # Set of formulas. Parent class of And/Or
    class Set < Formula
      include Dry::Equalizer(:formulas)
      extend Dry::Initializer

      param :formulas, type: DataTypes::FilledSetOf(Formula)

      def initialize(*formulas)
        super(formulas)
      end

      def free_variables
        formulas.map(&:free_variables).flatten
      end
    end

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
