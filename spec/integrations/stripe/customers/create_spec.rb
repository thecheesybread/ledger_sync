# frozen_string_literal: true

require 'spec_helper'

support :input_helpers
support :stripe_helpers

RSpec.describe 'stripe/customers/create', type: :feature do
  include InputHelpers
  include StripeHelpers

  before { stub_customer_create }

  let(:resource) do
    LedgerSync::Ledgers::Stripe::Customer.new(customer_resource(ledger_id: nil).except(:subsidiary))
  end

  let(:input) do
    {
      client: stripe_client,
      resource: resource
    }
  end

  context '#perform' do
    subject { LedgerSync::Ledgers::Stripe::Customer::Operations::Create.new(**input).perform }

    it { expect(subject).to be_a(LedgerSync::OperationResult::Success) }
    it { expect(subject.resource.ledger_id).to eq('cus_123') }
  end
end
