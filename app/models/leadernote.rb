class Leadernote < ActiveRecord::Base
  belongs_to :leader
  belongs_to :user

end