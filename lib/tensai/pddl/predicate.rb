# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types'
require 'tensai/pddl/data_types/variable_list'

module Tensai::Pddl
  # Predicate in a planning domain
  class Predicate
    include Dry::Initializer.define -> do
      param :name, type: DataTypes::Name
      option :variables, type: DataTypes::VariableList
    end
  end
end
