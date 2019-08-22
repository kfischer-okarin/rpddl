# frozen_string_literal: true

require 'dry-initializer'

require 'ruby_pddl/data_types'
require 'ruby_pddl/data_types/variable_list'

module RubyPddl
  # Predicate in a planning domain
  class Predicate
    include Dry::Initializer.define -> do
      param :name, type: DataTypes::Name
      option :variables, type: DataTypes::VariableList, default: -> { [] }
    end
  end
end
