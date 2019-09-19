# frozen_string_literal: true

require_relative 'set'

module Tensai::Pddl
  module Formulas
    # Disjunction
    class Or < Set
      def or(other)
        Or.new(*formulas, other)
      end
    end
  end

  # Formula extension
  class Formula
    def or(other)
      return other.or self if other.is_a? Formulas::Or

      Formulas::Or.new(self, other)
    end
  end
end
