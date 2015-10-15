class Poll < ActiveRecord::Base
  validates :author_id, presence: true
  validates :poll, presence: true

  

end
