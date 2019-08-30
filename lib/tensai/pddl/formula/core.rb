# frozen_string_literal: true

module Tensai::Pddl
  module Formula
    # Formula
    class Formula
      def and(other)
        And.new([self, other])
      end

      def not
        Negated.new self
      end

      private

      def initialize; end
    end
  end
end
