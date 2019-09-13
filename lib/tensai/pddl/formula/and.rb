# frozen_string_literal: true

module Tensai::Pddl
  module Formula
    # Conjunction
    class And < Set
      def and(other)
        And.new(*formulas, other)
      end
    end
  end
end
