class User < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many(
    :polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id
  )
  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :user_id,
    primary_key: :id
  )
  has_many :answers, :through => :responses, source: :answer_option


end
