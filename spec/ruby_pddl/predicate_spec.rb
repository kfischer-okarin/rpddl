# frozen_string_literal: true

require_relative '../spec_helper'

module RubyPddl
  RSpec.describe Predicate do
    describe '#name' do
      subject { Predicate.new(name) }

      it_behaves_like 'a named object'
    end

    describe '#variables' do
      subject { Predicate.new('predicate', variables: variables) }

      it_behaves_like 'a object containing variables'
    end
  end
end
