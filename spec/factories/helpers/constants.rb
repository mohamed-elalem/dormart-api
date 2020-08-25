module Helpers
  module Constants
    HEADERS = {
      'ACCEPT' => 'application/json',
      'Content-Type' => 'application/json'
    }  unless Object.const_defined?('HEADERS')
  end
end