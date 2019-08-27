# frozen_string_literal: true

require 'dry-types'

require 'tensai/pddl/data_types'
require 'tensai/pddl/variable'

module Tensai::Pddl
  module DataTypes
    VariableList = ListOf(Variable)
  end
end
