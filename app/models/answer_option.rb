class AnswerOption < ActiveRecord::Base
  validates :question_id, presence: true
  validates :answer_option, presence: true

  belongs_to(
    :question,
    class_name: "Question",
    foreign_key: :question_id,
    primary_key: :id
  )
  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :answer_option_id,
    primary_key: :id
  )
  has_many :respondents, :through => :responses, source: :respondent

end
