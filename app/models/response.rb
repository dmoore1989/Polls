class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_option_id, presence: true

  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  belongs_to(
    :answer_option,
    class_name: "AnswerOption",
    foreign_key: :answer_option_id,
    primary_key: :id
  )
end
