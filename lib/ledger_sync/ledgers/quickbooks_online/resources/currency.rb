# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module QuickBooksOnline
      class Currency < QuickBooksOnline::Resource
        attribute :exchange_rate, type: Type::Float
        attribute :name, type: Type::String
        attribute :symbol, type: Type::String
      end
    end
  end
end
