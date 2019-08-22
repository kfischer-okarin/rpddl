# frozen_string_literal: true

require_relative '../../spec_helper'

module RubyPddl
  module Action
    RSpec.describe Strips do
      describe '#name' do
        subject { Strips.new(name) }

        it_behaves_like 'a named object'
      end

      describe '#parameters' do
        subject { Strips.new('action', parameters: variables) }

        it_behaves_like 'a object containing variables', :parameters
      end
    end
  end
end
