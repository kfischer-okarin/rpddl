# frozen_string_literal: true

require 'dry-initializer'

require 'ruby_pddl/data_structures'
require 'ruby_pddl/data_types'
require 'ruby_pddl/variable'

module RubyPddl
  # Predicate in a planning domain
  class Predicate
    include Dry::Initializer.define -> do
      param :name, type: DataTypes::Name
      option :variables, type: DataTypes::ListOf(Variable), default: -> { [] }
    end
  end
end
