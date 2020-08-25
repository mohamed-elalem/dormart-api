require 'devise/jwt/test_helpers'

module Helpers
  module Authentication
    def auth_headers_for(user)
      Devise::JWT::TestHelpers.auth_headers({'Accept' => 'application/json'}, user, scope: user.class.name.downcase)
    end
  end
end