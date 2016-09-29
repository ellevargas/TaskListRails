class AddCompletionStatusToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completion_status, :boolean
  end
end
