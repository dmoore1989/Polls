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

  def nplusone_results
    options = self.answer_options

    options.reduce(Hash.new(0)) do |accum, option|
      accum[option.answer_option] += option.responses.count
      accum
    end
  end

  def results
    answers = self.answer_options.includes(:responses)
    answers.reduce(Hash.new(0)) { |accum, answer| accum[answer.answer_option] +=  answer.responses.length; accum }
  end

end
