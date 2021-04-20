# frozen_string_literal: true

require 'json'

module Xendit
  module ErrorHandler
    def handle_error_response(response) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
      parsed_response = JSON.parse(response.body)

      case parsed_response['error_code']
      when 'API_VALIDATION_ERROR'
        Exception.new('Request body is wrong, please check your payload.')
      when 'BANK_NOT_SUPPORTED_ERROR'
        Exception.new('Bank code is not currently supported.')
      when 'FIXED_PAYMENT_CODE_NOT_FOUND_ERROR'
        Exception.new('Fixed payment code not found.')
      when 'INVOICE_NOT_FOUND_ERROR'
        Exception.new('Invoice not found.')
      when 'MAXIMUM_EXPECTED_AMOUNT_ERROR'
        Exception.new('Input amount more than maximum value.')
      when 'MINIMUM_EXPECTED_AMOUNT_ERROR'
        Exception.new('Input amount less than minimum value.')
      when 'REQUEST_FORBIDDEN_ERROR'
        Exception.new('Your API key is not have permissions to perform request, please assign proper permission.')
      else
        Exception.new('Something went wrong, please try again.')
      end
    end
  end
end
