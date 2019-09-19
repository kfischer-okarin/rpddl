# frozen_string_literal: true

require_relative 'with_bound_variables'

module Tensai::Pddl
  module Formulas
    # A "there exists x such that ..." clause
    class ThereExists < WithBoundVariables
    end
  end
end
