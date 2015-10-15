class Question < ActiveRecord::Base
  validates :poll_id, presence: true
  validates :question, presence: true

end
