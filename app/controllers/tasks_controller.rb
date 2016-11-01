class TasksController < ApplicationController
  before_action :check_login
  before_action :find_task, except: [:index, :new, :create] # do I need to do this on new?
  # index is saying to find all, but should show tasks only for current user
  # not saying find task for destroy - need to find it in same way

  def index
    @tasks = Task.all
  end

  def new
    @mytask = Task.new
  end

  def create
    @mytask = Task.new
    @mytask.title = params[:task][:title]
    @mytask.description = params[:task][:description]
    @mytask.completed_at = params[:task][:completed_at]
    @mytask.completion_status = params[:task][:completion_status]
    @mytask.user = @user
    if @mytask.title == nil ||  @mytask.title == ""
      flash[:notice] = "Dude you need a title at the very least"
      redirect_to action: 'new'
    else
      @mytask.save
      redirect_to index_tasks_path
    end
  end

  def show; end

  def edit
    @mytask.save
    if @mytask == nil
      @mytask = {id: params[:id].to_i, title: "Dude that doesn't exist"}
    end

  end

  def update
    if @mytask.update(task_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def complete
    @mytask.marked_completed
    @mytask.save
    redirect_to action: 'index'
  end

  def destroy
    @mytask.destroy
    redirect_to action: 'index'
  end

  # puts statement in controller and model method to see if it worked
  # wrap saved in a conditional b/c it'll return true or false

private

  def task_params
    params.require(:task).permit(:title, :description)
    # this is for update/create/new, SHOULD USE when passing a hash to any of those methods, do this to prevent injection risks
  end
  
  def check_login
    if !session[:user_id]
      flash[:notice] = "Please log in first!"
      redirect_to root_path
    else
      @user = User.find_by(id: session[:user_id])
    end
  end

  def find_task
    @mytask = Task.find_by(id: params[:id])
    if !@mytask || !@user.tasks.include?(@mytask)
      flash[:notice] = "Sorry, that is not one of your tasks."
      redirect_to root_path
    end
  end

end

#new files in views/tasks (base on edit or something)
