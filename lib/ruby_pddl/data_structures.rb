# frozen_string_literal: true

require 'forwardable'

require 'dry-types'

require 'ruby_pddl/data_types/base'

module RubyPddl
  # Typed collection of named elements
  class NamedList
    extend Forwardable
    include Enumerable

    def initialize(type, elements)
      @type = DataTypes::Base.Instance(type)
      elements.each { |el| add el }
    end

    include Dry::Initializer.define -> do
      param :type, type: DataTypes::Base::Instance(Class)
    end

    def_delegators :elements, :keys, :key?, :[]

    def each
      elements.values.each { |el| yield el }
    end

    private

    attr_accessor :type

    def add(added)
      type[added]
      raise "Element named '#{added.name}' already contained" if elements.key? added.name

      elements[added.name] = added
    end

    def elements
      @elements ||= {}
    end
  end
end
