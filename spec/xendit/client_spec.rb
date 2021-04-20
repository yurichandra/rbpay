# frozen_string_literal: true

require 'rbpay/xendit/client'
require 'spec_helper'

RSpec.describe Xendit::Client do
  let(:api_key) { 'API_KEY' }
  let(:default_base_url) { 'https://api.xendit.co/v2/' }

  subject { described_class.new(api_key: api_key) }

  describe '#initialize' do
    context 'init class with default base_url' do
      it 'does return api_key and base_url' do
        expect(subject.api_key).to eql api_key
        expect(subject.base_url).to eql default_base_url
      end
    end

    context 'init class with new base_url' do
      let(:form) { described_class.new(api_key: api_key, base_url: 'https://api.xendit.co/') }

      it 'does return api_key and base_url' do
        expect(form.api_key).to eql api_key
        expect(form.base_url).to eql 'https://api.xendit.co/'
      end
    end
  end

  describe '#get' do
    it 'does return HTTP ok status' do
      VCR.use_cassette('xendit/invoices/all') do
        response = subject.get('invoices')
        expect(response.status).to eql 200
      end
    end
  end

  describe '#post' do
    it 'does return HTTP ok status' do
      VCR.use_cassette('xendit/invoices/create') do
        params = {
          "external_id": "test123",
          "amount": 40000,
          "payer_email": "test123@gmail.com",
          "description": "test"
        }

        response = subject.post('invoices', params)
        expect(response.status).to eql 200
      end
    end
  end
end
