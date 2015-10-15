class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_option_id, presence: true
  validate :respondent_has_not_already_answered_question

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

  private

  def respondent_has_not_already_answered_question

    question_test =   self
                      .answer_option
                      .question
                      .answer_options
                      .map(&:responses)
                      .flatten
                      .any? { |response| response.user_id == self.user_id } #inspect this

    if question_test
      errors[:user] << "You have already answered this question"
    end
  end
end
