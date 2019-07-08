require 'digest'

module Authentication
  class EncryptPassword

    def call(password)
      Digest::SHA2.hexdigest(password)
    end

  end
end
