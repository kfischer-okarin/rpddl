# frozen_string_literal: true

require_relative '../../spec_helper'

module Tensai::Pddl
  RSpec.describe DataTypes do
    shared_examples 'it accepts' do |value|
      it "accepts #{value}" do
        expect { subject[value] }.not_to raise_error
      end
    end

    shared_examples 'it does not accept' do |value|
      it "does not accept #{value}" do
        expect { subject[value] }.to raise_error Dry::Types::CoercionError
      end
    end

    describe '::VariableList' do
      subject { DataTypes::VariableList }

      include_examples 'it accepts', [Variable.new('a')]
      include_examples 'it accepts', [Variable.new('a'), Variable.new('b')]
      include_examples 'it does not accept', []
      include_examples 'it does not accept', Variable.new('a')
    end
  end
end
