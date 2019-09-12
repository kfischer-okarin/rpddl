# frozen_string_literal: true

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
  end
end
