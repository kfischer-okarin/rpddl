# frozen_string_literal: true

require 'dry-types'

require 'ruby_pddl/data_types/base'

module RubyPddl
  class NamedList
    include Enumerable

    def initialize(type, elements)
      @type = DataTypes::Base.Instance(type)
      elements.each { |el| add el }
    end

    include Dry::Initializer.define -> do
      param :type, type: DataTypes::Base::Instance(Class)
    end

    def each
      elements.values.each
    end

    def to_a
      elements.values.to_a
    end

    private

    attr_accessor :type

    def add(added)
      type[added]
      raise "Element named '#{added.name}' already contained" if elements.key? added.name

      elements[added.name] = added
      self
    end

    def elements
      @elements ||= {}
    end
  end
end
