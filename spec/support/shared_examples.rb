# frozen_string_literal: true

RSpec.shared_examples 'a named object' do
  context 'with a valid name' do
    let(:name) { 'valid-object' }

    it 'has the specified name' do
      expect(subject).to have_attributes(name: name)
    end
  end

  context 'with a valid name' do
    let(:name) { 'invalidName$$$' }

    it 'throws an error' do
      expect { subject }.to raise_error Dry::Types::ConstraintError
    end
  end
end
