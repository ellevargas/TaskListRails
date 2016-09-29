class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # @tasks = TasksController.alltasks
  end

  def new
  end

  def create
    @mytask = params
  end

  def show
    @tasks = TasksController.alltasks
    @mytask = nil

    @tasks.each do |task|
      number = params[:id].to_i
      # knows id because it was named in routes.rb in config
      if task[:id] == number
        @mytask = task
      end
    end
    if @mytask == nil
      @mytask = {id: params[:id].to_i, title: "Dude that doesn't exist"}
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def self.alltasks
    [
      {id: 1, title: "Do photo shoot", description: "Fresh and profesh for my Linkedin", completed_at: Time.now, completion_status: false},
      {id: 2, title: "Feed my face", description: "I am so damn hungry", completed_at: Time.now, completion_status: false},
      {id: 3, title: "Play board games", description: "As long as it's not Catan again", completed_at: Time.now, completion_status: false}
    ]
  end

end

#new files in views/tasks (base on edit or something)
