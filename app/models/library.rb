class Library < ActiveRecord::Base
    has_many :users
    has_many :schools
    has_many :subcriptors
    has_many :groups
    has_one :responsable
    
end
