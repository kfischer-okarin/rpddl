# frozen_string_literal: true

require_relative '../../spec_helper'

module Tensai::Pddl
  RSpec.describe Variable do
    describe '#name' do
      subject { Variable.new(name) }

      it_behaves_like 'a named object'
    end
  end
end
