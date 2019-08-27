# frozen_string_literal: true

require_relative '../../spec_helper'

module Tensai::Pddl
  RSpec.describe Entity do
    describe '#name' do
      subject { Entity.new(name) }

      it_behaves_like 'a named object'
    end
  end
end
