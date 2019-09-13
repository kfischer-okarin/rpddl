# frozen_string_literal: true

require 'dry-equalizer'
require 'dry-initializer'

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
  end
end
