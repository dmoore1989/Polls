class Question < ActiveRecord::Base
  validates :poll_id, presence: true
  validates :question, presence: true

  # Question#response
  has_many :responses, :through => :answer_options, source: :responses

  belongs_to(
    :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id
  )
  has_many(
    :answer_options,
    class_name: "AnswerOption",
    foreign_key: :question_id,
    primary_key: :id
  )

end
