class UserTask < ActiveRecord::Base
  attr_accessible :user_id, :task_id, :accept_at, :finished_at, :degree
  belongs_to :task
  belongs_to :user

  after_initialize :init
  def init
    self.degree  ||= 0
  end

  def finish
    self.finished_at = Time.now
    #get incentives
    self.save
  end

  def could_finish?
    self.degree.to_i >= self.task.requirement.to_i
  end
end
