class Book < ActiveRecord::Base
  belongs_to :library
  has_one :profile, dependent: :destroy
end
