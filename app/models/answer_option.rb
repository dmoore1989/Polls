class AnswerOption < ActiveRecord::Base
  validates :question_id, presence: true
  validates :answer_option, presence: true

end
