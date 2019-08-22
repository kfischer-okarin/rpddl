# frozen_string_literal: true

require 'dry-types'

require 'ruby_pddl/data_types'
require 'ruby_pddl/variable'

module RubyPddl
  module DataTypes
    VariableList = ListOf(Variable)
  end
end
