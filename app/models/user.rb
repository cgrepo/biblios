class User < ActiveRecord::Base
    has_secure_password
    validates 	:name, :fullname, :email , presence: true
    
    def self.valid_password?(pretended,usr)
      byebug
      if usr.authenticate(pretended)
          return true
      else
          usr.errors.add(:auth,'Error encontrado revise que tenga los datos correctos!')
          return false
      end
    end
end
