# frozen_string_literal: true

require 'dry-types'

require 'tensai/pddl/entity'
require 'tensai/pddl/variable'

module Tensai::Pddl
  module DataTypes
    Term = Base::Instance(Entity) | Base::Instance(Variable)
    Terms = Base::Hash.map(Name, Term)
  end
end
