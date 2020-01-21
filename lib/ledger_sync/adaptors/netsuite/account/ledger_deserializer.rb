# frozen_string_literal: true

module LedgerSync
  module Adaptors
    module NetSuite
      module Account
        class LedgerDeserializer < NetSuite::LedgerSerializer
          attribute ledger_attribute: :id,
                    resource_attribute: :ledger_id

          attribute ledger_attribute: :acctname,
                    resource_attribute: :name


          attribute ledger_attribute: :accttype,
                    resource_attribute: :account_type

          attribute ledger_attribute: :acctnumber,
                    resource_attribute: :number
        end
      end
    end
  end
end
