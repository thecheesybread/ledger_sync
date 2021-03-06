# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LedgerSync::Serializer::Delegator do
  let(:custom_resource_class) do
    new_resource_class(
      attributes: %i[
        foo
        type
      ]
    )
  end
  let(:resource) { custom_resource_class.new(foo: 'foo_1') }

  let(:test_serializer) do
    Class.new(described_class) do
      private

      def serializer_for(args = {})
        resource = args.fetch(:resource)

        case resource.type
        when 'type_1'
          Class.new(LedgerSync::Serializer) do
            attribute :bar,
                      resource_attribute: :foo
          end
        when 'type_2'
          Class.new(LedgerSync::Serializer) do
            attribute :baz,
                      resource_attribute: :foo
          end
        end
      end
    end
  end

  it do
    resource.type = 'type_1'
    h = {
      'bar' => 'foo_1'
    }
    expect(test_serializer.new.serialize(resource: resource)).to eq(h)
  end

  it do
    resource.type = 'type_2'
    h = {
      'baz' => 'foo_1'
    }
    expect(test_serializer.new.serialize(resource: resource)).to eq(h)
  end
end
