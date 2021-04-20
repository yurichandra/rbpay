# frozen_string_literal: true

require 'json'
require_relative 'base'
require 'rbpay/xendit/errors'

module Xendit
  class Invoice < Xendit::Base
    include ErrorHandler

    BASE_URL = 'invoices'

    def create(params)
      response = @client.post(BASE_URL, params)
      handle_response(response)
    end

    def find(invoice_id)
      response = @client.get("#{BASE_URL}/#{invoice_id}")
      handle_response(response)
    end

    def all
      response = @client.get(BASE_URL)
      handle_response(response)
    end

    def expire(invoice_id)
      response = @client.post("#{BASE_URL}/#{invoice_id}/expire!")
      handle_response(response)
    end
  end
end
