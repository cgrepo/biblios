class Library < ActiveRecord::Base
    has_many :users
    has_many :schools
    has_one :responable
end
