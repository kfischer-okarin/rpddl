# frozen_string_literal: true

require 'dry-types'

require 'ruby_pddl/data_types/base'

module RubyPddl
  class NamedList
    include Dry::Initializer.define -> do
      param :type, type: DataTypes::Base::Instance(Class)
    end

    def <<(added)
      raise "Element named '#{added.name}' already contained" if elements.key? added.name

      elements[added.name] = added
      self
    end

    def concat(added_elements)
      added_elements.each { |el| self << el }
      self
    end

    def to_a
      elements.values.to_a
    end

    private

    def elements
      @elements ||= {}
    end
  end
end
