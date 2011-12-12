class MyTasks
  def initialize(args)
    @user = args[:user]
    raise "user cannot nil" if @user.nil?
  end

  def accepted
    @user.tasks
  end

  def acceptables
    Task.all
  end

  def accept(args)
    @task_id =args[:task_id]
    accepted = @user.user_tasks.where(:task_id => @task_id,:finished_at=>nil)

    if accepted.blank?
      @user.tasks << Task.find(@task_id) 
      @user.save
    end
  end

end
