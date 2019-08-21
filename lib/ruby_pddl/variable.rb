# frozen_string_literal: true

require 'dry-initializer'

require 'ruby_pddl/data_types'

module RubyPddl
  # Variable in a atomic formula skeleton
  class Variable
    include Dry::Initializer.define -> do
      param :name, type: DataTypes::Name
    end
  end
end
