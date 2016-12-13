class Library < ActiveRecord::Base
    has_many :users
    has_one :responable
end
