class Reserved < ActiveRecord::Base
  belongs_to :book
  belongs_to :subscriptor
end
