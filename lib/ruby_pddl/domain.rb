# frozen_string_literal: true

require 'dry-initializer'

require 'ruby_pddl/data_types'

module RubyPddl
  # Planning Domain
  class Domain
    include Dry::Initializer.define -> do
      param :name, type: DataTypes::Name
    end
  end
end
