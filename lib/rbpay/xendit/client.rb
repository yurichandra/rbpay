# frozen_string_literal: true

require 'base64'
require 'excon'
require 'rubygems'
require 'byebug'

module Xendit
  class Client
    attr_reader :api_key, :base_url

    def initialize(api_key:, base_url: 'https://api.xendit.co/v2/')
      @api_key = api_key
      @base_url = base_url
    end

    def post(path, body)
      Excon.post(
        "#{@base_url}#{path}",
        body: JSON.generate(body),
        headers: {
          'Authorization': "Basic #{encoded_api_key}",
          'Content-Type': 'application/json'
        }
      )
    end

    def get(path)
      Excon.get(
        "#{@base_url}#{path}",
        headers: {
          'Authorization': "Basic #{encoded_api_key}",
          'Accept': 'application/json'
        }
      )
    end

    def patch(path, body)
      Excon.patch(
        "#{@base_url}#{path}",
        body: JSON.generate(body),
        headers: {
          'Authorization': "Basic #{encoded_api_key}",
          'Content-Type': 'application/json'
        }
      )
    end

    private

    def encoded_api_key
      key = @api_key + ':'

      Base64.urlsafe_encode64(key)
    end
  end
end
