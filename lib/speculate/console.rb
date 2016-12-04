require 'cgi'
require 'open-uri'
require 'json'

module Speculate
  ##
  # Define console URL class
  class Console
    def initialize(params = {})
      @options = params
    end

    def url
      @url ||= [
        'https://signin.aws.amazon.com/federation',
        '?Action=login',
        '&Issuer=',
        '&Destination=',
        CGI.escape('https://console.aws.amazon.com/'),
        '&SigninToken=',
        signin_token
      ].join
    end

    def logout_url
      @logout_url ||= 'https://console.aws.amazon.com/ec2/logout!doLogout'.freeze
    end

    private

    def signin_token
      @signin_token ||= JSON.parse(open(signin_token_url).read)['SigninToken']
    end

    def signin_token_url
      @signin_token_url ||= [
        'https://signin.aws.amazon.com/federation',
        '?Action=getSigninToken',
        '&Session=',
        CGI.escape(signin_token_creds.to_json)
      ].join
    end

    def signin_token_creds
      @signin_token_creds ||= {
        'sessionId' => @options[:creds].access_key_id,
        'sessionKey' => @options[:creds].secret_access_key,
        'sessionToken' => @options[:creds].session_token
      }
    end
  end
end
