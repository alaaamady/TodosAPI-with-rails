class JsonWebToken
    HMAC_SECRET = Rails.application.secrets.secret_key_base
    #encoding method: creates tokens based on a payload and expiration period 
    #(using the rail app unique secret key as the encoding key)
    def self.encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, HMAC_SECRET)
    end
  
    def self.decode(token)
      body = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new body
    rescue JWT::DecodeError => e
      raise ExceptionHandler::InvalidToken, e.message
    end
  end