class Msg < ActiveRecord::Base
  belongs_to :user
  belongs_to :getable,:foreign_key => "to", :class_name => "User"
end
