# frozen_string_literal: true

require 'dry-initializer'

require 'ruby_pddl/data_types'

module RubyPddl
  # Entity in the planning domain (PDDL constant/object)
  class Entity
    include Dry::Initializer.define -> do
      param :name, type: DataTypes::Name
    end
  end
end
