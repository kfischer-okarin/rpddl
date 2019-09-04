# frozen_string_literal: true

require 'dry-types'

require 'tensai/pddl/formula/and'
require 'tensai/pddl/formula/atom'

module Tensai::Pddl
  module DataTypes
    PositiveConjunction = InstanceOf(Formula::Atom) |
                          InstanceOf(Formula::And) do |conjunction|
                            conjunction.formulas.each { |f| InstanceOf(Formula::Atom)[f] }
                          end
  end
end
