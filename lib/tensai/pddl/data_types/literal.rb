# frozen_string_literal: true

require 'tensai/pddl/formulas/atom'
require 'tensai/pddl/formulas/negated'

module Tensai::Pddl
  module DataTypes
    Literal = InstanceOf(Formulas::Atom) |
              InstanceOf(Formulas::Negated)
              .constrained(fulfills: ->(negated) { negated.formula.is_a? Formulas::Atom })
  end
end
