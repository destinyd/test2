class MyTasks
  def initialize(args)
    @user = args[:user]
    raise "user cannot nil" if @user.nil?
  end

  def accepted
    @user.tasks - self.finisheds
  end

  def acceptables
    Task.all - @user.tasks
  end

  def accept(task_id)
    accepted = @user.user_tasks.where(:task_id => task_id,:finished_at=>nil)

    if accepted.blank?
      @task = Task.find(task_id)
      @user.tasks << @task
      @user.save
      @task
    end
  end

  def give_up(task_id)
    user_task = @user.user_tasks.where(:task_id => task_id).first
    if user_task
      @task = user_task.task
      user_task.destroy 
      @task
    end
  end

  def finish(task_id)
    user_task = @user.user_tasks.where(:finished_at => nil,:task_id => task_id).first
    user_task.finish if user_task and user_task.could_finish?
  end

  def finisheds
    finisheds = @user.user_tasks.where("finished_at IS NOT NULL").includes(:task)
    finisheds = finisheds.map(&:task)
  end

end
