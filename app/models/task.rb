class Task < ActiveRecord::Base
  belongs_to :user

  def marked_completed
    # puts completion_status
    # puts completed_at
    self.completion_status = true
    self.completed_at = Time.now
    # puts completion_status
    # puts completed_at
    # set completed status to true
    # set completed date to time.now
  end
end

# in app/models/Task.rb
class Task < ActiveRecord::Base
  validates :title, presence: :true
  validates_with MyValidator
end
