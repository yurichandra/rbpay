# frozen_string_literal: true

require_relative 'base'
require 'rbpay/xendit/errors'
require 'json'

module Xendit
  class RetailOutlet < Xendit::Base
    include ErrorHandler

    BASE_URL = 'fixed_payment_code'

    def create(params)
      response = @client.post(BASE_URL, params)
      handle_response(response)
    end

    def find(fixed_payment_code)
      response = @client.get("#{BASE_URL}/#{fixed_payment_code}")
      handle_response(response)
    end

    def update(fixed_payment_code, params)
      response = @client.patch("#{BASE_URL}/#{fixed_payment_code}", params)
      handle_response(response)
    end
  end
end
