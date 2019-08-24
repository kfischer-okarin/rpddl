# frozen_string_literal: true

require 'dry-initializer'

require 'ruby_pddl/atomic_formula'
require 'ruby_pddl/data_types'
require 'ruby_pddl/data_types/variable_list'
require 'ruby_pddl/variable'

module RubyPddl
  module Action
    # STRIPS-style action
    class Strips
      include Dry::Initializer.define -> do
        param :name, type: DataTypes::Name
        option :parameters, type: DataTypes::VariableList, default: -> { [] }
      end
    end
  end
end
