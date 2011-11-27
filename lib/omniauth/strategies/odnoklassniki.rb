require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies

    class Odnoklassniki < OmniAuth::Strategies::OAuth2
      option :name, 'odnoklassniki'

      option :client_options, {
        :site => 'http://www.odnoklassniki.ru/',
        :token_url => 'http://api.odnoklassniki.ru/oauth/token.do',
        :authorize_url => '/oauth/authorize'
      }

      option :access_token_options, {
        :mode => :query,
        :param_name => 'access_token'
      }

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
            'Odnoklassniki' => "http://www.odnoklassniki.ru/profile/#{uid}",
          }
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def callback_url
        if options.authorize_options.respond_to? :callback_url
          options.authorize_options.callback_url
        else
          super
        end
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
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
          params[:sig] = calculate_signature(params)
          access_token.get('http://api.odnoklassniki.ru/fb.do', :params => params).parsed
        end
      end

    end
  end
end
