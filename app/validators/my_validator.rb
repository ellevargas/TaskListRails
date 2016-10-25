class MyValidator < ActiveModel::Validator
  def validate(task)
    # unless task.completed_at = Time.now #find a way to add more time in api
    #   task.errors[:due_date] << 'A task must be due at a future date!'
    # end
  end
end
