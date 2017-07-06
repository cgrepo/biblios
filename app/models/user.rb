class User < ActiveRecord::Base
  has_secure_password
  validates :name, :fullname, :email, presence: true

  
  def self.valid_password?(pretended,usr)
    if usr.authenticate(pretended)
      return true
    else
      usr.errors.add(:authme,'Error revise que tenga los datos correctos')
      return false
    end
  end
  
  def self.equalPass?(pass,confirm,usr)
    if pass == confirm
      return true
    else
      usr.errors.add(:password_confirmation, 'Error los passwords no coinciden') 
      return false
    end
  end
end
