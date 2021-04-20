# frozen_string_literal: true

module Xendit
  class Base
    def initialize(client)
      @client = client
    end

    private

    def handle_response(response)
      return handle_error_response(response) if response.status != 200

      JSON.parse(response.body)
    end
  end
end
