# frozen_string_literal: true

require 'tensai/pddl/formula/atom'
require 'tensai/pddl/formula/negated'

module Tensai::Pddl
  module DataTypes
    Literal = InstanceOf(Formula::Atom) |
              InstanceOf(Formula::Negated) do |negated_formula|
                InstanceOf(Formula::Atom)[negated_formula.formula]
              end
  end
end
