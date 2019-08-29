# frozen_string_literal: true

require 'dry-types'

require 'tensai/pddl/entity'
require 'tensai/pddl/variable'

module Tensai::Pddl
  module DataTypes
    Term = InstanceOf(Entity) | InstanceOf(Variable)
    Terms = Base::Hash.map(Name, Term)
  end
end
