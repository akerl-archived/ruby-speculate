require 'aws-sdk'

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
      @url ||= Speculate::Console.new(creds: creds).url
    end

    private

    def assumed_role
      @assumed_role ||= client.assume_role(
        role_arn: role_arn,
        role_session_name: role_session_name
      )
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
