# frozen_string_literal: true

require 'tensai/pddl/data_types/literal'
require 'tensai/pddl/formula/and'
require 'tensai/pddl/formula/atom'

module Tensai::Pddl
  module DataTypes
    PositiveConjunction = InstanceOf(Formula::Atom) |
                          InstanceOf(Formula::And)
                          .constrained(fulfills: ->(conjunction) {
                            conjunction.formulas.all? { |f| f.is_a? Formula::Atom }
                          })

    Conjunction = Literal |
                  InstanceOf(Formula::And)
                  .constrained(fulfills: ->(conjunction) {
                    conjunction.formulas.all? { |f| Literal.valid? f }
                  })
  end
end
