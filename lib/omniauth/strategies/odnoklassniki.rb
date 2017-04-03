require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies

    class Odnoklassniki < OmniAuth::Strategies::OAuth2
      option :name, 'odnoklassniki'

      option :client_options, {
        :site => 'https://connect.ok.ru',
        :token_url => 'https://api.ok.ru/oauth/token.do',
        :authorize_url => '/oauth/authorize'
      }

      option :access_token_options, {
        :mode => :query,
        :param_name => 'access_token'
      }

      option :provider_ignores_state, true

      uid do
        raw_info['uid']
      end

      info do
        {
          :name => raw_info['name'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :image => raw_info['pic_1'],
          :urls => {
            'Odnoklassniki' => "https://ok.ru/profile/#{uid}",
          }
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def callback_url
        options.redirect_url || (full_host + script_name + callback_path)
      end

      def build_access_token
        verifier = request.params['code']
        client.auth_code.get_token(verifier, {:redirect_uri => callback_url}.merge(token_params.to_hash(:symbolize_keys => true)),
          {'expires' => 1800}.merge(options.access_token_options.to_hash(:symbolize_keys => true)))
      end

      private

      def calculate_signature(params)
        str = params.sort.collect { |c| "#{c[0]}=#{c[1]}" }.join('')
        Digest::MD5.hexdigest(str + Digest::MD5.hexdigest(access_token.token + options.client_secret))
      end

      def raw_info
        @raw_info ||= begin
          params = {
            'method' => 'users.getCurrentUser',
            'application_key' => options.public_key
          }
          params['fields'] = options[:info_fields] if options.key?(:info_fields)
          params['sig'] = calculate_signature(params)
          result = access_token.get('http://api.ok.ru/fb.do', :params => params).parsed
          raise CallbackError.new(nil, :invalid_response) if result['error_code'] || result['error_msg']
          result
        end
      end

    end
  end
end
