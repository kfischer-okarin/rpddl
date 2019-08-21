# frozen_string_literal: true

require_relative '../spec_helper'

module RubyPddl
  RSpec.describe Domain do
    let(:domain) { Domain.new('docks-world') }

    it 'has a name' do
      expect(domain).to have_attributes name: 'docks-world'
    end
  end
end
