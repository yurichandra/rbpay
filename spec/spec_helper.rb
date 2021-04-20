# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.hook_into :webmock
  config.filter_sensitive_data('<API_KEY>') { 'API_KEY' }
end
