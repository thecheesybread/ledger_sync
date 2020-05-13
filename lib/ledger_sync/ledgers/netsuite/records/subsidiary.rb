# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Subsidiary < NetSuite::Record
        attribute :name, type: LedgerSync::Type::String
        attribute :state, type: LedgerSync::Type::String
      end
    end
  end
end