# frozen_string_literal: true

require_relative '../../../spec_helper'

module Tensai::Pddl
  RSpec.describe Formulas::And do
    it_behaves_like 'a set of formulas' do
      subject { Formulas::And.new(*formulas) }
    end
  end
end
