# frozen_string_literal: true

require 'tensai/pddl/data_structures'
require 'tensai/pddl/variable'

module Tensai::Pddl
  module DataTypes
    VariableList = InstanceOf(NamedList)
                   .constructor(->(array) {
                     FilledArrayOf(Variable)[array]
                     NamedList.new(Variable, array)
                   })
  end
end
