class MyValidator < ActiveModel::Validator
  def validate(task)
    unless task.due_date >= Date.now
      task.errors[:due_date] << 'A task must be due at a future date!'
    end
  end
end
