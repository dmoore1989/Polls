class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_option_id, presence: true
  validate :respondent_has_not_already_answered_question
  # validate :author_cannot_answer_own_question

  # Response#question
  has_one :question, :through => :answer_option, source: :question

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

  def sibling_responses
    self.question.responses.where("? IS NULL OR responses.id != ?", self.id, self.id)
  end

  def respondent_has_not_already_answered_question

    question_test = sibling_responses.any? { |response| response.user_id == self.user_id }

    if question_test
      errors[:user] << "You have already answered this question"
    end
  end

  def author_cannot_answer_own_question

    if self.question.poll.author_id == self.user_id
      errors[:user] << "You can't answer you're own poll!!"
    end
  end
end
