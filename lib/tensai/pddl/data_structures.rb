# frozen_string_literal: true

require 'forwardable'

module Tensai::Pddl
  # Typed collection of named elements
  class NamedList
    extend Forwardable
    include Enumerable

    def initialize(elements)
      elements.each { |el| add el }
    end

    def_delegators :elements, :keys, :key?, :[], :empty?

    def each
      elements.values.each { |el| yield el }
    end

    private

    attr_accessor :type

    def add(added)
      raise "Element named '#{added.name}' already contained" if elements.key? added.name

      elements[added.name] = added
    end

    def elements
      @elements ||= {}
    end
  end
end
