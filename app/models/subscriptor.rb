class Subscriptor < ActiveRecord::Base
  mount_uploader :picture, MyPictureUploader
  belongs_to :group
  belongs_to :school
  has_many :borrows
end
