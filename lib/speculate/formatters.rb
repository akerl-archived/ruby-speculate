module Speculate
  ##
  # Formatter module for printing creds to terminal
  module Formatters
    def to_envvars
      @to_envvars ||= {
        AWS_ACCESS_KEY_ID: creds.access_key_id,
        AWS_SECRET_ACCESS_KEY: creds.secret_access_key,
        AWS_SECURITY_TOKEN: creds.session_token
      }.map { |k, v| "export #{k}=#{v}" }.join("\n")
    end
  end
end
