# frozen_string_literal: true

require_relative '../../spec_helper'

module Tensai::Pddl
  RSpec.describe Predicate do
    describe '#name' do
      subject { build(:predicate, name: name) }

      it_behaves_like 'a named object'
    end

    describe '#variables' do
      subject { build(:predicate, variables: variables) }

      it_behaves_like 'a object containing variables'
    end
  end
end
