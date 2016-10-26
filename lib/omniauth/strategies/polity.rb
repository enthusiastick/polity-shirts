module OmniAuth
  module Strategies
    class Polity < OmniAuth::Strategies::OAuth2
      option :name, :polity

      option :client_options, {
        site: "http://localhost:3000",
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          email: raw_info["email"],
          first_name: raw_info["first_name"],
          handle: raw_info["handle"],
          last_name: raw_info["last_name"]
        }
      end

      def callback_url
         full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me').parsed["user"]
      end
    end
  end
end
