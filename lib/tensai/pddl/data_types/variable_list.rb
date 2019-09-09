# frozen_string_literal: true

require 'tensai/pddl/data_structures'
require 'tensai/pddl/variable'

module Tensai::Pddl
  module DataTypes
    VariableList = InstanceOf(NamedList)
                   .constructor(->(array) { NamedList.new(Variable, array) })
                   .constrained(fulfills: ->(list) { !list.empty? })
  end
end
