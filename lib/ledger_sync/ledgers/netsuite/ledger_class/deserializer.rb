# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class LedgerClass
        class Deserializer < NetSuite::Deserializer
          id

          attribute :name
        end
      end
    end
  end
end
