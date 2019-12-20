# frozen_string_literal: true

module LedgerSync
  module Adaptors
    module NetSuiteREST
      module Customer
        module Operations
          class Find < NetSuiteREST::Operation::Find
            class Contract < LedgerSync::Adaptors::Contract
              params do
                required(:external_id).maybe(:string)
                required(:ledger_id).filled(:string)
                required(:email).maybe(:string)
                required(:name).maybe(:string)
                required(:phone_number).maybe(:string)
                required(:subsidiary).maybe(:hash, Types::Reference)
              end
            end
          end
        end
      end
    end
  end
end