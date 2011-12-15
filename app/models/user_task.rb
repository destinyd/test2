class UserTask < ActiveRecord::Base
  attr_accessible :user_id, :task_id, :accept_at, :finished_at, :degree
  belongs_to :task
  belongs_to :user
  def finish
    self.finished_at = Time.now
    #get incentives
    self.save
  end

  def could_finish?
    self.degree >= self.task.requirement.to_i
  end
end
