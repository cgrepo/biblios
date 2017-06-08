class Borrowed < ActiveRecord::Base
  belongs_to :book
  belongs_to :subscriptor
  
  def self.subscriptor_limit_reached?(subscriptor)
    return true if Borrowed.all.where('subscriptor_id = ?',subscriptor).count > 2
    return false
  end
end
