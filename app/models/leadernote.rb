class Leadernote < ActiveRecord::Base
  belongs_to :leader
  belongs_to :user

  default_scope order('created_at desc')

end