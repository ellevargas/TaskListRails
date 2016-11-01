class Task < ActiveRecord::Base
  belongs_to :user
  validates :title, :user_id, presence: :true

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
