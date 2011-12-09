class UserTasksController < ApplicationController
  def index
    @user_tasks = UserTask.all
  end

  def show
    @user_task = UserTask.find(params[:id])
  end

  def new
    @user_task = UserTask.new
  end

  def create
    @user_task = UserTask.new(params[:user_task])
    if @user_task.save
      redirect_to @user_task, :notice => "Successfully created user task."
    else
      render :action => 'new'
    end
  end

  def edit
    @user_task = UserTask.find(params[:id])
  end

  def update
    @user_task = UserTask.find(params[:id])
    if @user_task.update_attributes(params[:user_task])
      redirect_to @user_task, :notice  => "Successfully updated user task."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_task = UserTask.find(params[:id])
    @user_task.destroy
    redirect_to user_tasks_url, :notice => "Successfully destroyed user task."
  end
end
