class Task < ActiveRecord::Base
  attr_accessible :name, :desc, :requirement_desc, :requirement, :incentives_desc, :incentives, :type_id, :times, :started_at, :finished_at, :group_id
  has_many :user_tasks
  has_many :users,:through => :user_tasks
end
