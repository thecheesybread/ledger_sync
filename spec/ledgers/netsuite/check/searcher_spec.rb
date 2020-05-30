# frozen_string_literal: true

require 'spec_helper'

support 'netsuite/shared_examples'

RSpec.describe LedgerSync::Ledgers::NetSuite::Check::Searcher do
  include NetSuiteHelpers

  it_behaves_like 'a netsuite searcher'
end
