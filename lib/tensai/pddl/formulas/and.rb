# frozen_string_literal: true

require_relative 'set'

module Tensai::Pddl
  module Formulas
    # Conjunction
    class And < Set
      def and(other)
        And.new(*formulas, other)
      end
    end
  end

  # Formula extension
  class Formula
    def and(other)
      return other.and self if other.is_a? Formulas::And

      Formulas::And.new(self, other)
    end
  end
end
