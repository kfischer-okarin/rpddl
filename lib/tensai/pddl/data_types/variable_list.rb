# frozen_string_literal: true

require 'tensai/pddl/data_structures'
require 'tensai/pddl/variable'

module Tensai::Pddl
  module DataTypes
    VariableList = Base::Constructor(NamedList)
                       .constrained(fulfills: ->(list) { !list.empty? })
  end
end
