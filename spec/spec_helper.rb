# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.hook_into :webmock
  config.filter_sensitive_data('<API_KEY>') do
    'eG5kX2RldmVsb3BtZW50XzJSMzhHNlBTSXppa2tCNjZvSXpKUXFna3hkREVHV1FaaEZCQ213VU9ycGRUUU1rUDlaMHI4WnViNFFUTW46'
  end
end
