# frozen_string_literal: true

require 'tensai/pddl/formula/atom'
require 'tensai/pddl/formula/negated'

module Tensai::Pddl
  module DataTypes
    Literal = InstanceOf(Formula::Atom) |
              InstanceOf(Formula::Negated)
              .constrained(fulfills: ->(negated) { negated.formula.is_a? Formula::Atom })
  end
end
