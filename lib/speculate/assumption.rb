require 'cgi'
require 'aws-sdk'
require 'open-uri'
require 'json'

module Speculate
  ##
  # Base class for assumptions
  class Assumption
    def initialize(params = {})
      @options = params
    end

    def creds
      @creds ||= assumed_role.credentials
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

    private

    def assumed_role
      @assumed_role ||= client.assume_role(
        role_arn: role_arn,
        role_session_name: role_session_name
      )
    end

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
        'sessionId' => creds.access_key_id,
        'sessionKey' => creds.secret_access_key,
        'sessionToken' => creds.session_token
      }
    end

    def client
      @client ||= Aws::STS::Client.new
    end

    def role_name
      @role ||= @options[:role_name] || raise('No role_name supplied')
    end

    def target_account_id
      @target_account_id ||= @options[:account_id] || local_account_id
    end

    def local_account_id
      @local_account_id ||= local_identity.account
    end

    def local_user_name
      @local_user_name ||= local_identity.arn.split(':').last.tr('/', '_')
    end

    def local_identity
      @local_identity ||= client.get_caller_identity
    end

    def role_arn
      @role_arn ||= "arn:aws:iam::#{target_account_id}:role/#{role_name}"
    end

    def role_session_name
      @role_session_name ||= local_user_name
    end
  end
end
