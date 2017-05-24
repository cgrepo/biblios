class Borrowed < ActiveRecord::Base
  belongs_to :book
  belongs_to :subscriptor
  
  def limit_reached?
    
  end
end
