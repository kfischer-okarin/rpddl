# frozen_string_literal: true

module Tensai::Pddl
  RSpec.shared_examples 'a named object' do
    context 'with a valid name' do
      let(:name) { 'valid-object' }

      it 'has the specified name' do
        expect(subject).to have_attributes(name: name)
      end
    end

    context 'with a invalid name' do
      let(:name) { 'invalidName$$$' }

      it 'throws an error' do
        expect { subject }.to raise_error Dry::Types::CoercionError
      end
    end
  end

  RSpec.shared_examples 'a object containing variables' do |attribute = :variables|
    context 'with one variable' do
      let(:variables) { [Variable.new('a')] }

      it 'has the specified variables' do
        expect(subject.send(attribute)).to contain_exactly(*variables)
      end
    end

    context 'with several variable' do
      let(:variables) { [Variable.new('a'), Variable.new('b')] }

      it 'has the specified variables' do
        expect(subject.send(attribute)).to contain_exactly(*variables)
      end
    end

    context 'with a non-variable' do
      let(:variables) { ['not-a-variable'] }

      it 'throws an error' do
        expect { subject }.to raise_error Dry::Types::CoercionError
      end
    end
  end
end
