# frozen_string_literal: true

module Tensai::Pddl
  module Formula
    # Disjunction
    class Or < Set
      def or(other)
        Or.new(*formulas, other)
      end
    end
  end
end
