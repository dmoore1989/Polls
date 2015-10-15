class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_option_id, presence: true
end
