# frozen_string_literal: true

require 'tensai/pddl/data_types/literal'
require 'tensai/pddl/formulas/and'
require 'tensai/pddl/formulas/atom'

module Tensai::Pddl
  module DataTypes
    PositiveConjunction = InstanceOf(Formulas::Atom) |
                          InstanceOf(Formulas::And)
                          .constrained(fulfills: ->(conjunction) {
                            conjunction.formulas.all? { |f| f.is_a? Formulas::Atom }
                          })

    Conjunction = Literal |
                  InstanceOf(Formulas::And)
                  .constrained(fulfills: ->(conjunction) {
                    conjunction.formulas.all? { |f| Literal.valid? f }
                  })
  end
end
