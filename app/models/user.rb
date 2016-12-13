class User < ActiveRecord::Base
    has_secure_password
    validates 	:name, :fullname, :email , presence: true
end
