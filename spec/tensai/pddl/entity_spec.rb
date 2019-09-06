# frozen_string_literal: true

require_relative '../../spec_helper'

module Tensai::Pddl
  RSpec.describe Entity do
    describe '#name' do
      subject { build(:entity, name: name) }

      it_behaves_like 'a named object'
    end
  end
end
