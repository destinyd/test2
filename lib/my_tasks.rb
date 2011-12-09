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
end
