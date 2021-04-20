# frozen_string_literal: true

require 'json'
require 'rbpay/xendit/errors'
require_relative 'base'

module Xendit
  class VirtualAccount < Base
    def create(params)
      response = @client.post('callback_virtual_accounts', params)
      handle_response(response)
    end

    def available_banks
      response = @client.get('available_virtual_account_banks')
      handle_response(response)
    end

    def find(id)
      response = @client.get("callback_virtual_accounts/#{id}")
      handle_response(response)
    end

    def update(id, params)
      response = @client.patch("callback_virtual_accounts/#{id}", params)
      handle_response(response)
    end
  end
end
