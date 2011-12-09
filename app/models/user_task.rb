class UserTask < ActiveRecord::Base
  attr_accessible :user_id, :task_id, :accept_at, :finished_at, :degree
  belongs_to :task
  belongs_to :user
end
