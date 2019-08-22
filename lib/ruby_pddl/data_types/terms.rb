# frozen_string_literal: true

require 'dry-types'

require 'ruby_pddl/entity'
require 'ruby_pddl/variable'

module RubyPddl
  module DataTypes
    Term = Base::Instance(Entity) | Base::Instance(Variable)
    Terms = Base::Hash.map(Name, Term)
  end
end
